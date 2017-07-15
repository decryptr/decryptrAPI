#' Print input for debug purposes
#'
#' Print input for debug purposes
#'
#' @export
print_input <- function(img) {
  print(img)
}

#' Predict captcha
#'
#' Predict captcha
#'
#' @export
predict_captcha <- function(img, type) {
  eval(parse(text = sprintf('predict_%s', type)))(img)
}

predict_rfb <- function(img) {
  predict(rfb_model, newdata = decryptr::prepare(decryptr::read_captcha(img)))
}

predict_trt <- function(img) {
  predict(trt_model, newdata = decryptr::prepare(decryptr::read_captcha(img)))
}

predict_esaj <- function(img) {
  predict(esaj_model, newdata = decryptr::prepare(decryptr::read_captcha(img)))
}

predict_esaj <- function(img) {
  predict(tjmg_model, newdata = decryptr::prepare(decryptr::read_captcha(img)))
}
