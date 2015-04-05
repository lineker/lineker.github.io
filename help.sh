install() {
  sudo gem jekyll
  gem install bundler
  #create GemFile
  sudo bundle install
}

run(){
bundle exec jekyll serve
}

$@
