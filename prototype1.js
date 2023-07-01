/* Adler32-based hash function */
function hash(string) {
	let s1 = 1
	let s2 = 0
	for (let n = 0; n < string.length; n++) {
		s1 = (s1 + string.codePointAt(n)) % 65521
		s2 = (s2 + s1) % 65521
	}
	return (s2 << 16) | s1
}

/* Generate a seeded, (pseudo)random integer between the given bounds. */
function random_int(seed, minimum, maximum) {
	const span = maximum - minimum
	return hash(seed) % span + minimum
}

/* Pick a seeded, random element from the given array. */
function random_element(seed, array) {
	return array[random_int(seed, 0, array.length - 1)]
}

/* Repeat an array several times. */
function repeat(n, base) {
	let result = []
	for (let i = 0; i < n; i++)
		result = result.concat(base)
	return result
}

/* Same as Number.prototype.toFixed(), but positive numbers receive a sign. */
function toSignedFixed(f, n) {
	if (f > 0)
		return "+" + f.toFixed(n)
	return f.toFixed(n)
}

/* Construct a stock object */
function new_stock(idx, name, symbol, price, gl, recommendation, owned) {
	return {
		idx,
		name,
		symbol,
		price,
		gl,
		recommendation,
		owned,
	}
}

/* Construct a stock from a stem and symbol. */
function generate_stock(idx, stem, symbol) {
	const name = random_element(stem, company_names_for(stem))
	const price = random_int(stem, 100, 10000) / 100
	const gl = random_int(stem, -100, 100) / 100
	const recommendation = random_element(stem, recommendation_numbers)
	const owned = random_int(stem, -10, 100)
	return new_stock(idx, name, symbol, price, gl, recommendation, owned)
}

/* Construct a report object for a given symbol and recommendation. Other
stocks are only read to maybe include in the reports. */
function generate_report(name, recommendation, other_stock_names) {
	const headlines = report_headlines_for(name, recommendation,
		other_stock_names)
	const bodies = report_bodies_for(name, recommendation,
		other_stock_names)
	return {
		headline: random_element(name, headlines),
		body: random_element(name, bodies),
	}
}

/* Turn a recommendation number into "buy," "sell," or "hold." */
function to_verb(recommendation) {
	if (recommendation > 0) {
		return "buy"
	}
	if (recommendation < 0) {
		return "sell"
	}
	return "hold"
}

/* Turn a recommendation number into "buy stock in," "sell stock from," or
"hold your position with." */
function to_phrase(recommendation) {
	if (recommendation > 0) {
		return "buy stock in"
	}
	if (recommendation < 0) {
		return "sell stock from"
	}
	return "hold your position with"
}

/* Recommendation numbers, weighted. */
const recommendation_numbers = [].concat(
	repeat(10, [0]),
	repeat(3, [3, -3]),
	repeat(2, [10, -10]),
)

/* Returns a list of possible headlines for the given stock name and
recommendation numbers. Other stock names may be mentioned. */
function report_headlines_for(name, recommendation, other_stock_names) {
	return [
		`Based on your previous investing activity with
			${random_element(name, other_stock_names)}, TryTrade
			recommends that you ${to_phrase(recommendation)}
			${name}.`,
		`Based on widespread market trends, TryTrade recommends that
			you ${to_phrase(recommendation)} ${name}.`,
		`Based on the current trend in its stock price, TryTrade
			recommends that you ${to_phrase(recommendation)}
			${name}.`,
	]
}

/* Return a list of possible body texts for a given stock name and
recoomendation number. */
function report_bodies_for(name, recommendation) {
	if (recommendation > 0) {
		return [
			`Quarterly profits from ${name} are high than expected
				in their most recent quarterly report.`,
			`The price of ${name}'s stock has been rising
				an exciting product announcement, and is
				expected to continue climbing in the coming
				days.`,

			`TryTrade users have received large dividends from
				${name}'s stock.`,
			`Several TryTrade users have lost money on short
				positions in ${name}.`,
			`Several TryTrade users have made money on long
				positions in ${name}.`,
		]
	}
	if (recommendation < 0) {
		return [
			`Rumors of a series of layoffs at ${name} are causing
				some investors to sell the stock, expecting its
				value to fall in the coming days.`,
			`Underwhelming quarterly profits from ${name} have been
				causing the value of its stock to lose value.`,
			`The price of ${name}'s stock has fallen after
				a large product recall, and is expected to
				keep falling further in the coming days.`,

			`TryTrade users reported receiving less dividends from
				${name}'s stock than they anticipated.`,
			`Several TryTrade users have lost money on long
				positions in ${name}.`,
			`Several TryTrade users have made money on short
				positions in ${name}.`,
		]
	}
	return [
		`Stock prices for ${name} are expected to hold steady.`,
		`Stock prices for ${name} have been holding steady.`,
		`Stock prices for ${name} have been rising gradually
			for the past month.`,
	]
}

/* Return a list of possible company names for a given stem. */
function company_names_for(stem) {
	const domestic = [
		`${stem} Corp`,
		`${stem} Corporation`,
		`${stem}, Inc`,
		`${stem}, Incorporated`,
		`${stem} Company`,
		`${stem} Motor Company`,
		`${stem} Industries`,
		`${stem} Technologies`,
		`${stem} Pharma`,
		`${stem} Holdings`,
		`${stem} Records`,
	]
	const foreign = [
		`${stem} Company, GmbH`,
		`${stem} Company, AG`,
		`${stem} Company, plc`,
		`${stem} Company, S.A.`,
		`${stem} Company, S.p.a.`,
	]
	return repeat(5, domestic).concat(foreign)
}

/* Alphabetical stock names and stems. */
const stems = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")
	.map((stem) => {return {stem, symbol: stem + stem + stem}})

/* Stock objects. */
let stocks = stems.map(({stem, symbol}, idx) => generate_stock(idx, stem, symbol))

const page_size = 5

/* App state */
let shown_stocks = stocks
let table_page = 0
let detailed_stock = 0
let show_buy = 1
let show_sell = 1
let show_normal = 1
let filter = ""

function table_row(idx, className, symbol, name, price, gl) {
	const tr = document.createElement("tr")
	tr.className = className
	tr.innerHTML = `
		<th scope="row">${symbol}</th>
		<td>${name}</td>
		<td class="text-end">${price}</td>
		<td class="text-end">${gl}</td>
		<td class="text-center"> <div class="btn-group">
			<a href="javascript:focus_stock(${idx})" class="btn btn-primary">Details</a>
		</div> </td>
	`
	return tr
}

function render_table() {
	const tbody = document.getElementById("tablebody")
	tbody.innerHTML = ""
	if (shown_stocks.length == 0)
		return
	for (let n = 0; n < page_size; n++) {
		const i = table_page * page_size + n
		if (i >= shown_stocks.length)
			break
		tbody.append(table_row(
			shown_stocks[i].idx,
			shown_stocks[i].recommendation > 0
				? "table-success"
				: shown_stocks[i].recommendation < 0
					? "table-warning"
					: "",
			shown_stocks[i].symbol,
			shown_stocks[i].name,
			shown_stocks[i].price.toFixed(2),
			toSignedFixed(shown_stocks[i].gl, 2),
		))
	}
}

function render_pagination() {
	for (let i = 0; i < 6; i++) {
		document.getElementById(`pager-${i + 1}`).className =
			shown_stocks.length < page_size * i
				? "page-item disabled"
				: "page-item"
	}
	document.getElementById("pager-prev").className =
		table_page == 0 ? "page-item disabled" : "page-item"
	const shown_pages = Math.ceil(shown_stocks.length / page_size) - 1
	document.getElementById("pager-next").className =
		table_page == shown_pages ? "page-item disabled" : "page-item"
	if (table_page >= 0)
		document.getElementById(`pager-${table_page + 1}`).className += " active"
}

function render_details() {
	const stock = stocks[detailed_stock]
	const {headline, body} =
		generate_report(stock.name, stock.recommendation, stocks.map(({name}) => name))
	document.getElementById("details-header").innerHTML =
		`${stock.name} Details`
	document.getElementById("details-owned").innerHTML = stock.owned < 0
		? `You are short ${-stock.owned} shares.`
		: `You own ${stock.owned} shares.`
	document.getElementById("details-report-headline").innerHTML = headline
	document.getElementById("details-report-body").innerHTML = body
		
}

function show_by_recommendation(recommendation) {
	if (recommendation > 0)
		return show_buy
	if (recommendation < 0)
		return show_sell
	return show_normal
}

function show_by_name(name) {
	if (filter == "")
		return true
	const regexp = new RegExp(filter, "i")
	return name.search(regexp) != -1
}

function validate_state() {
	document.getElementById("search").value = filter
	shown_stocks = stocks.filter(({name, symbol, recommendation}) => {
		return show_by_recommendation(recommendation)
			&& (show_by_name(name) || show_by_name(symbol))
	})
	if (detailed_stock < 0)
		detailed_stock = 0
	if (detailed_stock >= stocks.length)
		detailed_stock = stocks.length - 1
	const shown_pages = Math.ceil(shown_stocks.length / page_size)
	table_page = Math.floor(table_page)
	if (table_page < 0)
		table_page = 0
	if (table_page >= shown_pages)
		table_page = shown_pages - 1
}

function update() {
	validate_state()
	render_table()
	render_pagination()
	render_details()
}

update()

function select_page(n) {
	table_page = n - 1
	update()
}

function move_page(n) {
	table_page += n
	update()
}

function focus_stock(n) {
	detailed_stock = n
	update()
}

function buy(sign) {
	const n = +(document.getElementById("details-buyamt").value) * sign
	stocks[detailed_stock].owned += n
	/*stocks[detailed_stock].recommendation -= n*/
	update()
}

function toggle_normal() {
	show_normal = !show_normal
	update()
}

function toggle_buy() {
	show_buy = !show_buy
	update()
}

function toggle_sell() {
	show_sell = !show_sell
	update()
}

function set_filter() {
	filter = document.getElementById("search").value
	update()
}
