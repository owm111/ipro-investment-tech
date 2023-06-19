beginhtml(Education Platform Prototype)
<div class="container">
	<div class="card my-4" style="max-width: 400px">
		cardheader(Learn about investing and the stock market)
		<div class="card-body">
			<h2 class="h4 card-title">News & Lessons for You</h2>
			<p class="card-text">Recommended news and lessons for you, based on your interests and habits.</p>
		</div>
		<ul class="list-group list-group-flush">
			lgitem(`Lesson 1 summarybtns(View)')
			lgitem(`News Item 1 summarybtns(Read)')
			lgitem(`Lesson 2 summarybtns(View)')
			lgitem(`Lesson 3 summarybtns(View)')
			lgitem(`News Item 2 summarybtns(Watch)')
			lgitem(`<a href="#">See more...</a>')
		</ul>
	</div>
</div>
<div class="container-fluid"><hr/></div>
<div class="container">
	<div class="p-5 my-4 bg-body-tertiary rounded-4">
		<div class="container-fluid py-5">
			<h1 class="display-2">Education Platform</h1>
		</div>
	</div>
	<main class="row" data-masonry='{"percentPosition": "true"}'>
		edulesson(cardheader(Saved for later), Lesson 1, `edulessonleader', `Video (6 minutes)', 5, Relevant to your portfolio)
		edunews(cardheader(Recommended for you), edunewsimg, News Item 1, `edunewsleader', 4 hours ago, Read)
		edulesson(cardheader(Recommended for you), Lesson 2, `edulessonleader', `Article (4-minute read)', 4, Relevant to your portfolio)
		edulesson(cardheader(Recommended for you), Lesson 3, `edulessonleader', `Video (10 minutes)', 6, Based on your previous interests)
		edunews(cardheader(Featured), edunewsimg, News Item 2, `edunewsleader', 6 hours ago, Watch)
		edunews(, edunewsimg, News Item 3, `edunewsleader', 2 days ago, Listen)
		edulesson(, Lesson 4, `edulessonleader', `Video (3 minutes)', 2, Popular among similar users)
		edumore()
	</main>
		<!--
	<main>
		<h2>News</h2>
		<div class="row" data-masonry="{\"percentPosition\": \"true\"}">
			edunews(cardheader(Recommended for you), edunewsimg, News Item 1, `edunewsleader', 4 hours ago, Read)
			edunews(cardheader(Featured), edunewsimg, News Item 2, `edunewsleader', 6 hours ago, Watch)
			edunews(, edunewsimg, News Item 3, `edunewsleader', 2 days ago, Listen)
			edumore()
		</div>
		<h2>Lessons</h2>
		<div class="row" data-masonry="{\"percentPosition\": \"true\"}">
			edulesson(cardheader(Saved for later), Lesson 1, `edulessonleader', `Video (6 minutes)', 5, Relevant to your portfolio)
			edulesson(cardheader(Recommended for you), Lesson 2, `edulessonleader', `Article (4-minute read)', 4, Relevant to your portfolio)
			edulesson(cardheader(Recommended for you), Lesson 3, `edulessonleader', `Video (10 minutes)', 6, Based on your previous interests)
			edulesson(, Lesson 4, `edulessonleader', `Video (3 minutes)', 2, Popular among similar users)
			edumore()
		</div>
	</main>
		-->
</div>
endhtml()
