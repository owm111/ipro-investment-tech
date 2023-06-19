dnl
dnl HTML
dnl
define(beginhtml, <!DOCTYPE html>
	<html lang="en-US">
		<head>
			<meta charset="utf8"/>
			<title>$1</title>
			<link rel="stylesheet" href="styles/bootstrap.min.css"/>
		</head>
		<body>)dnl
define(endhtml, <script src="scripts/masonry.min.js"></script></body></html>)dnl
dnl
dnl General
dnl
define(pthidenotes,
  <button class="btn btn-lg btn-danger" onclick="Array.from(document.getElementsByClassName('note')).forEach(e => e.style.display = 'none')">Hide notes</button>
  <button class="btn btn-lg btn-danger" onclick="Array.from(document.getElementsByClassName('note')).forEach(e => e.style.display = 'block')">Show notes</button>
)dnl
define(ptnote, <div class="card bg-danger rounded-3 text-white my-3 note">
  <div class="card-header">Note</div>
  <div class="card-body"><p class="card-text">$1</p></div>
</div>)dnl
dnl
dnl Prototype 1
dnl
define(tablerow, <tr class="$1">
	<th scope="row">$2</th>
	<td>$3</td>
	<td class="text-end">$4</td>
	<td class="text-end">$5</td>
	<td class="text-center"><div class="btn-group">
		<button class="btn btn-primary">Details</button>
	</div></td>
</tr>)dnl
define(paginationlink, <li class="page-item $1">
	<a href="$2" class="page-link">$3</a>
</li>)dnl
dnl
dnl Prototype 2
dnl
define(lgitem, <li class="list-group-item">$1</li>)dnl
define(summarybtns, <span class="float-end">
  <a href="#" class="btn btn-sm btn-primary">$1 now</a>
  <a href="#" class="btn btn-sm btn-secondary">$1 later</a>
</span>)dnl
define(cardheader, <div class="card-header">$1</div>)dnl
define(educol, <div class="col-sm-6 col-lg-4 mb-5">$1</div>)dnl
define(edunews, educol(<div class="card">
  $1
  <img class="card-img-top" src="$2"/>
  <div class="card-body">
    <h3 class="card-title">$3</h3>
    <p class="card-text">$4</p>
  </div>
  <div class="card-body">
    <a href="#" class="btn btn-primary">$6 now</a>
    <a href="#" class="btn btn-secondary">$6 later</a>
  </div>
  <div class="card-footer text-body-secondary">$5</div>
</div>))dnl
define(edulesson, educol(<div class="card">
  $1
  <div class="card-body">
    <h3 class="card-title">$2</h3>
    <p class="card-text">$3</p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">$4</li>
    <li class="list-group-item">$5 review questions</li>
    <li class="list-group-item">$6</li>
  </ul>
  <div class="card-body">
    <a href="#" class="btn btn-primary">View now</a>
    <a href="#" class="btn btn-secondary">View later</a>
  </div>
</div>))dnl
define(edumore, educol(<div class="card text-center p-3 text-bg-primary">
  <a class="btn btn-lg btn-outline-light" href="#">See more</a>
</div>))dnl
define(edunewsimg, https://placehold.co/1920x1080?text=Header+Image)dnl
define(edunewsleader, `A brief summary of the post or the first few sentences from it will go here. These news items will discuss a recent stock market-related event and what it means for investors in simple terms. If integrated into the user&lsquo;s portfolio, also what it means for their specific stocks.')dnl
define(edulessonleader, `A brief summary of the lesson. Each lesson may consist of text or a video explaining investing concepts, situations, etc. and a review quiz for users to test their knowledge.')dnl
