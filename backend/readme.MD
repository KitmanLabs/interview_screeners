Thanks for applying to Kitman Labs! Below you'll find our technical screener.

Once you've gone through this and sent us some answers, we'll have someone review it. That step can take a few days. Once that's complete, we'll set up a phone call with one of the team.

# About the screener
- When you're working on the coding questions, you should treat it like real world production code. We'll want to see a test suite, comments where required and things like that. It's important to focus on the details. It shouldn't feel like code you've hacked together in a rush, but something you'd be proud to have your name on.
- In terms of what programming language or frameworks to use, you should use whatever you feel is best suited to the task.
- We've ballparked the tasks at around 2/3 hours, but just let us know when you'll get back to us and we'll be waiting. You have a life beyond this interview and that's completely reasonable!
- Hopefully it's a reasonably fun problem and shouldn't pose too much of a challenge. If you can give us a rough idea of when we should expect your answers, that would great. We're pretty flexible on how you provide the answers. You can send over a link to a Github/Bitbucket repo, some folks send over a series of Github gists, others a zipped up copy of the code etc.

# Questions
- What's your proudest achievement? Something you've done in work, some random side project, code or otherwise. Just make sure you explain what it is that makes you so proud of it.
- What's the most interesting technical article you've read recently and why? Convince us that we really need to check it out.
- Write some code that will flatten an array of arbitrarily nested arrays of integers into a flat array of integers. e.g. `[[1,2,[3]],4]` -> `[1,2,3,4]`. This is an opportunity to show us your understanding of computer science fundamentals. Avoid using built-in language methods like `Array.flatten`
- Given a file (`rugby_athletes.json` in this directory), containing a JSON encoded list of Squads and Athletes, plus a squad ID, output an entirely new squad of 15 for a rugby team using the following criteria
  - No players in the team should be injured
  - The team should be a valid Rugby Union team - (2 props, 1 hooker, 2 locks, 2 flankers, 1 Number Eight, 1 Scrum Half, 1 Out Half, 2 Centres, 2 Wingers, 1 Full Back)
  - The output should contain at least the following - squad name, squad ID and a list of the players with their position, eg 'prop - Colm Doyle'
