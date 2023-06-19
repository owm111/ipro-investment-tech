beginhtml(Investment Platform Prototype)
<div class="container">                                                         
	pthidenotes()
        ptnote(Red notes like these document features that have not been implemented into the prototypes yet. These notes will not be visible in the final product.)
</div>                                                                          
<div class="container-fluid"><hr/></div>
<div class="container">

	ptnote(`This is the dashboard of the investment platform. There will be other pages for adjusting settings, etc.')
	<h1 class="display-2">Investment Platform</h1>
	<div class="row">
		<div class="col-md mb-5">
			<h2>Stocks</h2>
			ptnote(`Below is the list of stocks for the user to select. The "filters" area will let the user search for stocks and hide those that the platform thinks they will not be interested in. When the user clicks the "details" button next a stock, more information about the stock will be shown to the right (large devices) or below (small devices).')
			<div class="row">
				<div class="col-sm-2 mb-2">
					<p class="h4">Filters</p>
				</div>
				<div class="col-sm input-group mb-2">
					<span class="input-group-text">Show...</span>
					<input type="text" class="form-control" placeholder="Name"/>
				</div>
				<div class="col-sm btn-group mb-2">
					<button class="btn" disabled="disabled">Hide...</button>
					<button class="btn btn-secondary">Normal</button>
					<button class="btn btn-success">Buy</button>
					<button class="btn btn-warning">Sell</button>
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
				<tbody>
					tablerow(table-success, AAAA, AAAA Corp, 123.45, +6.78)
					tablerow(, BBBB, BBBB Inc, 56.38, +0.34)
					tablerow(table-warning, CCCC, CCC Corp, 78.10, -1.44)
					tablerow(table-success, DDDD, DDDD Inc, 384.22, -10.44)
				</tbody>
			</table>
			<nav>
				<ul class="pagination justify-content-center">
					paginationlink(disabled, `#', Previous)
					paginationlink(active, `#', 1)
					paginationlink(, `#', 2)
					paginationlink(, `#', 3)
					paginationlink(, `#', 4)
					paginationlink(, `#', 5)
					paginationlink(, `#', Next)
				</ul>
			</nav>
			<hr/>
			ptnote(`The most requested feature based on our customer discovered was personalized recommendations. Rows in the table above are highlighted based on the platform's recommendations. The colors are explained below.')
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
			<h2>AAAA Corp Details</h2>
			<img class="img-fluid d-block" src="https://placehold.co/1920x1080?text=Candlestick+Chart"/>
			ptnote(`This section displays more information about the stock the user has selected than is shown in the table. Below are the buttons that will allow the user to buy or sell the stock. At the bottom is the peronalized report if the stock was recommended to them by the platform, explaining why this stock may interest them or be a good investment.')
			<div class="row my-3">
				<div class="col input-group">
					<span class="input-group-text">#</span>
					<input type="text" class="form-control" value="1"/>
				</div>
				<div class="col btn-group">
					<button class="btn btn-secondary">Buy</button>
					<button class="btn btn-secondary">Sell</button>
				</div>
			</div>
			<h3>Personalized Report</h3>
			<p class="lead">Based on your previous investments in <strong>CCC Corp</strong>, you may consider investing in AAAA Corp.</p>
			<p>AAA Corp's stock price is beginning to rise in anticipation of their upcoming product announcement.</p>
		</div>
	</div>
</div>
endhtml()
