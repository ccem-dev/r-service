# plumber.R

#* Runner
#* @post /runner
#'@serializer html
runner <- function(req){
  body <- jsonlite::fromJSON(req$postBody)
  script <- body$script
  arg <- body$arg
  f <- eval(parse(text=script))
  return(jsonlite::toJSON(f(arg), pretty=T, auto_unbox=T))
}
