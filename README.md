# Rails Portfolio Project: Favorite Video Games 2

## About

Welcome to my Ruby on Rails portfolio project! In this repository, you will find an app built with Rails, that directs you to a website in which you can login or sign up and post about your favorite video games. This is a continuation of my past Sinatra Portfolio Project, where you could also post about your favorite video games, but this time you can categorize these video games by genre. This is thanks to the "has_many through:" associations that I've learned through this mod.

Anyways, if you do not have an account in the database, you must sign up. Once you sign up, you will be directed to your Account Settings page. If you login with the correct credentials, you will be also be directed to your Account Settings page. Then, you have an option to create a new favorite video game to post, or go to your wall, where it lists/reads the favorite video games that you have posted. If you haven't posted any video games, then your wall will be empty. If you have created a favorite video game, then you will be directed to its show page, where it shows the name, description, and genre of the video game. The genre has a clickable link which brings it to its own show page, and lists the video games that it has recorded for that genre, your own favorite video games of course. You can also edit the video game to your preference. Once you go back to your wall, you'll see a video game listed on your wall, listed as "Game:" and "Genre". There is a clickable link on the video game that brings you to its show page in case you want to read it. On your wall, you can also click a button that says "Browse by Genre", where you can see the genres that you've used when posting your video games. Each genre listed there has a link to their show pages listing the video games in their category.

## Install Instructions

1. Clone this repositroy.

2. Get into the directory of this repository, writing `cd video-games-rails-project` in your terminal.

3. Run `bundle install` in your terminal.

4. Run `bundle exec rake webpacker:install` in your terminal.

5. Run `rails s` in your terminal.

6. Copy and paste the localhost link that the `rails s` server is running onto your browser.

7. From there, you should be at the welcome page where you can either login or sign up.

## Contributor's Guide

Bug reports and pull requests are welcome on GitHub at https://github.com/tomasperez10/video-games-rails-project/pulls. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## Code of Conduct

Everyone interacting in the `video-games-rails-project` project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the code of conduct.


