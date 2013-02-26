bundle exec rake assets:precompile
git add public/assets/
git commit -m "deploy"
git push
git push heroku master
