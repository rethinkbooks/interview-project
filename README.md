# interview-project
Bookshout interview project.

Assignment: Using the GitHub Search API, implement a single page React/Rails web app that queries repositories based on user input and displays the following data / options:

Business Requirements:
- A list of the results along with the programming language for that repo
- A filtering of the results based on the languages returned (can use AJAX or make separate requests)
- Sort by stars in either asc or desc order
- Pagination, if available
- Persist the user's information upon logging in to the app in a DB

Technical Requirements:
- Use Ruby on Rails
- Push code to GitHub public repo
- While the GitHub search API is public and can be used without authentication, you must authenticate your user and make authenticated requests. Tools like Omniauth / Devise might be useful.
- It must be deployed to either a micro EC2 instance or Heroku Instance
- While we won't be too picky on the front end, ideally the app should be presentable. A basic Bootstrap or Foundation theme is perfect
- You must persist some data in a database. Ideally, this would be the user's information that comes back from their API after authenticating with OAuth 2


Everything else is up to you and you are free to use any tools / gems / libaries you need to get the job done. 

Things we look for:
- Code quality
- Specs / Tests
- Use of tools / gems / etc
- Speed of completion (On average, people get it knocked out in 3 days max)
- Anything you think will make your app special. Extra credit is always good.
