% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trendfilter.R
\name{trendfilter.control.list}
\alias{trendfilter.control.list}
\title{Control list for tuning trend filtering algorithm}
\usage{
trendfilter.control.list(rho = 1, obj_tol = 1e-05,
  obj_tol_newton = obj_tol, max_iter = 200L, max_iter_newton = 50L,
  x_tol = 1e-06, alpha_ls = 0.5, gamma_ls = 0.8, max_iter_ls = 30L,
  tridiag = 0)
}
\arguments{
\item{rho}{this is a scaling factor for the augmented Lagrangian parameter in the ADMM
algorithm. To solve a given trend filtering problem with locations \code{x}
at a tuning parameter value \code{lambda}, the augmented Lagrangian parameter
is set to be \code{rho * lambda * ((max(x)-min(x))/n)^k}.}

\item{obj_tol}{the tolerance used in the stopping criterion; when the relative change in
objective values is less than this value, the algorithm terminates.}

\item{max_iter}{number of ADMM iterations used; ignored for k=0.}

\item{max_iter_newton}{for non-Gaussian GLM losses, the number of outer iterations used in Newton's method.}

\item{x_tol}{defines uniqueness or sameness of x's. If we make bins of size x_tol and 
find at least two x's which fall into the same bin, then we thin the data.}

\item{alpha_ls}{tuning parameter for the line search used in the proximal Newton procedure for
non-Gaussian GLM losses.}

\item{gamma_ls}{tuning parameter for the line search used in the proximal Newton for non-Gaussian
GLM losses.}

\item{max_iter_ls}{tuning parameter for the number of line search iterations in the proximal Newton
procedure for non-Gaussian GLM losses.}
}
\value{
a list of parameters.
}
\description{
Constructs the control parameters for the trend filtering
algorithm. Allows the user to customize as many or as
little as desired.
}
\examples{
 set.seed(0)
 n = 100
 x = runif(n, min=-2*pi, max=2*pi)
 y = 1.5*sin(x) + sin(2*x) + rnorm(n, sd=0.2)
 out = trendfilter(x, y, k=2, control=trendfilter.control.list(rho=3))

}
\seealso{
\code{\link{trendfilter}}
}
\author{
Taylor Arnold, Veeranjaneyulu Sadhanala, Ryan Tibshirani
}
