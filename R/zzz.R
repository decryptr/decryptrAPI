.onLoad <- function(libname, pkgname) {
  reticulate::py_available(TRUE)
  suppressMessages(suppressWarnings({
    rfb_model <<- decryptrModels::read_model('rfb')
    trt_model <<- decryptrModels::read_model('trt')
    tjmg_model <<- decryptrModels::read_model('tjmg')
    esaj_model <<- decryptrModels::read_model('esaj')
  }))
}
