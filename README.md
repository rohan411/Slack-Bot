# Ruby Learning SlackBot

A slack bot for reminding and asking the users about the topic that they are learning. 


## Prerequisite  

*Rails > 4*  

*Ruby > 2*  

*Redis*

*Postgresql*  


## Steps to run
* enter the slack bot token, redis config and database config in environment_variables.yml
* run **rake db:create**
* run **rake db:migrate**
* run **rails server**
* run **bundle exec sidekiq** (for background job server)
* visit the index url, e.g localhost:3000, to start the slack bot client


## Usage

While learning any topic
	
    To learning bot : "I am learning algebra"

    If it's a first message from the user to the learning bot, a new user will be created in the database,
    or if it's an existing user, only a new topic entry will be created.
    Assessments will be enqueued based on the learning configuration.

Assessment question my the bot after the scheduled time

    To user : "Hey @user, do you remeber the topic_id : 1, which is : algebra?"

Response for the assessment :

    To learning bot : "Yes/NO I remeber the topic id : 1"

    If the response is "Yes", rest of the assessment will be in the queue.

    If the response is "No", assessments with the give learning time configuration of an user will be 
    enqueued again in sidekiq(background worker)

The topic status would be marked as **mastered** after responding yes to all the assessments.