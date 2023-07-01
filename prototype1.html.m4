beginhtml(TryTrade Dashboard Prototype)
<div class="container">

	<h1 class="display-2">TryTrade Dashboard</h1>
	<div class="row">
		<div class="col-md mb-5">
			<h2>Stocks</h2>
			<div class="row">
				<div class="col-sm-2 mb-2">
					<p class="h4">Filters</p>
				</div>
				<div class="col-sm input-group mb-2">
					<span class="input-group-text">Show...</span>
					<input type="text" class="form-control" placeholder="Name" id="search" oninput="set_filter()"/>
				</div>
				<div class="col-sm btn-group mb-2">
					<button class="btn" disabled="disabled">Hide...</button>
					<a href="javascript:toggle_normal()" class="btn btn-secondary">Normal</a>
					<a href="javascript:toggle_buy()" class="btn btn-success">Buy</a>
					<a href="javascript:toggle_sell()" class="btn btn-warning">Sell</a>
				</div>
			</div>
			<table id="stocktable" class="table table-hover table-responsive">
				<thead>
					<tr>
						<th class="text-center" scope="col" colspan="2">Stock</th>
						<th class="text-center" scope="col">Price</th>
						<th class="text-center" scope="col"><abbr title="Gains/Losses">G/L</abbr></th>
						<th class="text-center" scope="col"></th>
					</tr>
				</thead>
				<tbody id="tablebody">
					tablerow(table-success, AAAA, AAAA Corp, 123.45, +6.78)
					tablerow(, BBBB, BBBB Inc, 56.38, +0.34)
					tablerow(table-warning, CCCC, CCC Corp, 78.10, -1.44)
					tablerow(table-success, DDDD, DDDD Inc, 384.22, -10.44)
				</tbody>
			</table>
			<nav>
				<ul id="pager" class="pagination justify-content-center">
					paginationlink(disabled, `javascript:move_page(-1)', Previous, id="pager-prev")
					paginationlink(, `javascript:select_page(1)', 1, id="pager-1")
					paginationlink(, `javascript:select_page(2)', 2, id="pager-2")
					paginationlink(, `javascript:select_page(3)', 3, id="pager-3")
					paginationlink(, `javascript:select_page(4)', 4, id="pager-4")
					paginationlink(, `javascript:select_page(5)', 5, id="pager-5")
					paginationlink(, `javascript:select_page(6)', 6, id="pager-6")
					paginationlink(, `javascript:move_page(1)', Next, id="pager-next")
				</ul>
			</nav>
			<hr/>
			<div class="card bg-info">
				<div class="card-header">Key</div>
				<div class="card-body">
					<p class="card-text">Based on your preferences and activity, stocks that may interest you are colored according the following scheme:</p>
					<dl class="card-text row">
						<dt class="col-sm-3">Green</dt>
						<dd class="col-sm-9">A stock you may consider buying.</dd>
						<dt class="col-sm-3">Yellow</dt>
						<dd class="col-sm-9">A stock you may consider selling.</dd>
					</dl>
				</div>
			</div>
		</div>
		<div class="col-md">
			<h2 id="details-header">AAAA Corp Details</h2>
			<img class="img-fluid d-block" src="https://placehold.co/1920x1080?text=Candlestick+Chart"/>
			<p id="details-owned">You own 0 shares.</p>
			<div class="row my-3">
				<div class="col input-group">
					<span class="input-group-text">#</span>
					<input id="details-buyamt" type="text" class="form-control" value="1"/>
				</div>
				<div class="col btn-group">
					<a href="javascript:buy(1)" class="btn btn-secondary">Buy</a>
					<a href="javascript:buy(-1)" class="btn btn-secondary">Sell</a>
				</div>
			</div>
			<h3>Personalized Report</h3>
			<p class="lead" id="details-report-headline">Based on your previous investments in <strong>CCC Corp</strong>, you may consider investing in AAAA Corp.</p>
			<p id="details-report-body">AAA Corp's stock price is beginning to rise in anticipation of their upcoming product announcement.</p>
		</div>
	</div>
</div>
<script src="scripts/prototype1.js"></script>
endhtml()
