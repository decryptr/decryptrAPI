#' Print input
#'
#' Print input for debug purposes.
#'
#' @param img image content.
#'
#' @export
print_input <- function(img) {
  print(img)
}

#' Predict captcha
#'
#' Predict captcha using fitted keras models.
#'
#' @param img image content.
#' @param type one of \code{rfb}, \code{trt}, \code{tjmg} or \code{esaj}.
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
