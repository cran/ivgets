% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/isativ.R
\name{isat.ivreg}
\alias{isat.ivreg}
\title{Indicator saturation modeling on an ivreg object}
\usage{
\method{isat}{ivreg}(
  y,
  iis = TRUE,
  sis = FALSE,
  tis = FALSE,
  uis = FALSE,
  blocks = NULL,
  ratio.threshold = 0.8,
  max.block.size = 30,
  t.pval = 1/NROW(data),
  wald.pval = t.pval,
  do.pet = FALSE,
  ar.LjungB = NULL,
  arch.LjungB = NULL,
  normality.JarqueB = NULL,
  info.method = c("sc", "aic", "hq"),
  include.1cut = FALSE,
  include.empty = FALSE,
  max.paths = NULL,
  parallel.options = NULL,
  turbo = FALSE,
  tol = 1e-07,
  max.regs = NULL,
  print.searchinfo = TRUE,
  plot = NULL,
  alarm = FALSE,
  overid = NULL,
  weak = NULL,
  fast = FALSE,
  ...
)
}
\arguments{
\item{y}{An object of class \code{"ivreg"}, as returned by
\code{\link[ivreg:ivreg]{ivreg::ivreg()}}.}

\item{iis}{logical. If \code{TRUE}, impulse indicator saturation is performed.}

\item{sis}{logical. If \code{TRUE}, step indicator saturation is performed.}

\item{tis}{logical. If \code{TRUE}, trend indicator saturation is performed.}

\item{uis}{a matrix of regressors, or a list of matrices. If a list, the
matrices must have named columns that should not overlap with column names
of any other matrices in the list.}

\item{blocks}{\code{NULL} (default), an integer (the number of blocks) or a user-specified \code{list} that indicates how blocks should be put together. If \code{NULL}, then the number of blocks is determined automatically}

\item{ratio.threshold}{Minimum ratio of variables in each block to total observations to determine the block size, default=0.8. Only relevant if blocks = \code{NULL} }

\item{max.block.size}{Maximum size of block of variables to be selected over, default=30. Block size used is the maximum of given by either the ratio.threshold and max.block.size }

\item{t.pval}{numeric value between 0 and 1. The significance level used for the two-sided regressor significance t-tests}

\item{wald.pval}{numeric value between 0 and 1. The significance level used for the Parsimonious Encompassing Tests (PETs)}

\item{do.pet}{logical. If \code{TRUE}, then a Parsimonious Encompassing Test (PET) against the GUM is undertaken at each regressor removal for the joint significance of all the deleted regressors along the current path. If FALSE (default), then a PET is not undertaken at each regressor removal. By default, the numeric value is the same as that of \code{t.pval}}

\item{ar.LjungB}{a two-item list with names \code{lag} and \code{pval}, or NULL (default). In the former case \code{lag} contains the order of the Ljung and Box (1979) test for serial correlation in the standardised residuals, and \code{pval} contains the significance level. If \code{lag=NULL} (default), then the order used is that of the estimated 'arx' object. If \code{ar.Ljungb=NULL}, then the standardised residuals are not checked for serial correlation}

\item{arch.LjungB}{a two-item list with names \code{lag} and \code{pval}, or NULL (default). In the former case, \code{lag} contains the order of the Ljung and Box (1979) test for serial correlation in the squared standardised residuals, and \code{pval} contains the significance level. If \code{lag=NULL} (default), then the order used is that of the estimated 'arx' object. If \code{arch.Ljungb=NULL}, then the standardised residuals are not checked for ARCH}

\item{normality.JarqueB}{\code{NULL} (the default) or a value between 0 and 1. In the latter case, a test for non-normality is conducted using a significance level equal to \code{normality.JarqueB}. If \code{NULL}, then no test for non-normality is conducted}

\item{info.method}{character string, "sc" (default), "aic" or "hq", which determines the information criterion to be used when selecting among terminal models. The abbreviations are short for the Schwarz or Bayesian information criterion (sc), the Akaike information criterion (aic) and the Hannan-Quinn (hq) information criterion}

\item{include.1cut}{logical. If \code{TRUE}, then the 1-cut model is included among the terminal models, if it passes the diagnostic tests, even if it is not equal to one of the terminals. If FALSE (default), then the 1-cut model is not included (unless it is one of the terminals)}

\item{include.empty}{logical. If \code{TRUE}, then an empty model is included among the terminal models, if it passes the diagnostic tests, even if it is not equal to one of the terminals. If FALSE (default), then the empty model is not included (unless it is one of the terminals)}

\item{max.paths}{\code{NULL} (default) or an integer indicating the maximum number of paths to search}

\item{parallel.options}{\code{NULL} or an integer, i.e. the number of cores/threads to be used for parallel computing (implemented w/\code{makeCluster} and \code{parLapply})}

\item{turbo}{logical. If \code{TRUE}, then (parts of) paths are not searched twice (or more) unnecessarily, thus yielding a significant potential for speed-gain. However, the checking of whether the search has arrived at a point it has already been comes with a slight computational overhead. Accordingly, if \code{turbo=TRUE}, then the total search time might in fact be higher than if \code{turbo=FALSE}. This happens if estimation is very fast, say, less than quarter of a second. Hence the default is \code{FALSE}}

\item{tol}{numeric value (default = 1e-07). The tolerance for detecting linear dependencies in the columns of the regressors (see \code{\link{qr}} function). Only used if LAPACK is FALSE (default)}

\item{max.regs}{integer. The maximum number of regressions along a deletion path. It is not recommended that this is altered}

\item{print.searchinfo}{logical. If \code{TRUE} (default), then a print is returned whenever simiplification along a new path is started, and whenever regressors are dropped due to exact multicolinearity}

\item{plot}{NULL or logical. If \code{TRUE}, then the fitted values and the residuals of the final model are plotted after model selection. If NULL (default), then the value set by \code{\link{options}} determines whether a plot is produced or not.}

\item{alarm}{logical. If \code{TRUE}, then a sound is emitted (in order to alert the user) when the model selection ends}

\item{overid}{\code{NULL} if no Sargan test of overidentifying restrictions
should be used as a diagnostic check for model selection or a numeric value
between 0 and 1. In the latter case, the test is conducted using this value
as the significance level.}

\item{weak}{\code{NULL} if no weak instrument F-test on the first stage
should be used as a diagnostic check for model selection or a numeric value
between 0 and 1. In the latter case, the test is conducted using this value
as the significance level.}

\item{fast}{A logical value indicating whether to speed up the 2SLS
estimation but providing less details. Requires \code{overid == NULL} and
\code{weak == NULL}.}

\item{...}{Further arguments passed to or from other methods.}
}
\value{
Returns a list of class \code{"ivisat"} with two named elements.
\code{$selection} stores the selection results from
\code{\link[gets]{isat}} (including paths, terminal models, and best
specification). \code{$final} stores the \code{\link[ivreg]{ivreg}} model
object of the best specification or \code{NULL} if the GUM does not pass
all diagnostics.
}
\description{
\code{isat.ivreg} conducts indicator saturation model selection on an ivreg
object returned by \code{\link[ivreg:ivreg]{ivreg::ivreg()}}.
}
