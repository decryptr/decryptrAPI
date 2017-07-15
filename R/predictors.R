#' Predict captcha
#'
#' Predict captcha using fitted keras models.
#'
#' @param img image content.
#' @param type one of \code{rfb}, \code{trt}, \code{tjmg} or \code{esaj}.
#' @param base64 passing base64 image as argument.
#'
#' @import decryptr
#'
#' @export
predict_captcha <- function(img, type, base64 = TRUE) {
  if (base64) {
    decoded <- base64enc::base64decode(img)
  } else {
    decoded <- decryptr::read_captcha(img)
  }
  eval(parse(text = sprintf('predict_%s', type)))(decoded)
}

predict_rfb <- function(img) {
  predict(rfb_model, newdata = decryptr::prepare(img))
}

predict_trt <- function(img) {
  predict(trt_model, newdata = decryptr::prepare(img))
}

predict_esaj <- function(img) {
  predict(esaj_model, newdata = decryptr::prepare(img))
}

predict_tjmg <- function(img) {
  predict(tjmg_model, newdata = decryptr::prepare(img))
}
