beginhtml(Education Platform Prototype)
<div class="container">
	pthidenotes()
	ptnote(Red notes like these document features that have not been implemented into the prototypes yet. These notes will not be visible in the final product.)
</div>
<div class="container-fluid"><hr/></div>
<div class="container">
	ptnote(`Below is a widget which could be embedded into another application, e.g., an investment platform. It provides a quick summary of the full layout below.')
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
	ptnote(`Below is the full interface of the platform. Users could access it directly or via the above embedded interface. There will be other pages for users to adjust their settings, manage integrations, etc.')
	<div class="p-5 my-4 bg-body-tertiary rounded-4">
		<div class="container-fluid py-5">
			<h1 class="display-2">Education Platform</h1>
		</div>
	</div>
	ptnote(`These panels represent news articles, educational videos, and lessons related to the stock market and investing. The platform will personalize what is recommended to each user based on what they have saved for later, their preferences, what they have read in the past, and, if integerated into another application, their investment portfolio. Once finished, the buttons will link to the relevant page where the user can watch the video, view the lesson, listen to the podcast, etc.')
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
