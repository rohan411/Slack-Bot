# Ruby Learning SlackBot

A slack bot for reminding and asking the users about the topic that they are learning. 


## Prerequisite  

*Rails > 4*  

*Ruby > 2*  

*Redis*

*Postgresql*  


## Steps to run
* enter the slack bot token and database details in environment_variables.yml
* run **rake db:create**
* run **rake db:migrate**
* run **rails server**
* run **bundle exec sidekiq** (for background job server)
* visit the index url, e.g localhost:3000, to start the slack bot client


## Usage

While learning any topic
	
    To learning bot : "I am learning algebra"

Assessment question my the bot after the scheduled time

    To user : "Hey @user, do you remeber the topic_id : 1, which is : algebra?"

Response for the assessment :

    To learning bot : "Yes/NO I remeber the topic id : 1"

The topic status would be marked as **mastered** after responding yes to all the assessments.