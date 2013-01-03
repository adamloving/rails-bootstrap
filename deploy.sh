bundle exec rake assets:precompile
git add public/assets/
git add public/javascripts/
git commit -m "deploy"
git push
git push heroku master
