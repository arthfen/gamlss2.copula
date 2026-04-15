\name{gamlss2.copula-package}
\alias{gamlss2.copula-package}
\alias{gamlss2.copula}
\docType{package}
\title{
	\packageTitle{gamlss2.copula}
}
\description{
	\packageDescription{gamlss2.copula}
}
\details{
	The DESCRIPTION file:
	\packageDESCRIPTION{gamlss2.copula}
	\packageIndices{gamlss2.copula}
}
\author{
	\packageAuthor{gamlss2.copula}
	Maintainer: \packageMaintainer{gamlss2.copula}
}
\references{
	Kalliovirta, L. (2008). \emph{Quantile residuals for multivariate models}. Helsinki Center of
	Economic Research Discussion Papers, 247.

	Joe, H. (2023). \emph{Dependence Modeling with Copulas}. CRC Press. ISBN 978-1032477374.

	Stasinopoulos D. M., Rigby R.A., Heller G., Voudouris V., and De Bastiani F., (2017)
	\emph{Flexible Regression and Smoothing: Using GAMLSS in R},  Chapman and Hall/CRC.  
	(see also \url{https://www.gamlss.com/}).
}
\keyword{package}
\seealso{\code{\link[gamlss]{gamlss}}, \code{\link[gamlss.dist]{gamlss.family}}}

\examples{\dontrun{
library(copula)
library(gamlss2)
library(gamlss.dist)
library(gamlss2.copula)

## Generates two log-modified families
gen.Family('SN2', type = 'log')
gen.Family('SEP4', type = 'log')

## Generates the bivariate copula
gen.copula('logSN2', 'logSEP4', 'PL', name = 'copula')

## Defines the parameter formulas
eq.mu1 <- y ~ 1
eq.sigma1 <- eq.nu1 <- ~ 1
eq.mu2 <- eq.sigma2 <- eq.nu2 <- eq.tau2 <- ~ 1
eq.theta <- ~ 1
eq.lst <- list(eq.mu1, eq.sigma1, eq.nu1,
	eq.mu2, eq.sigma2, eq.nu2, eq.tau2,
	eq.theta)

## Simulates some data with known parameters
set.seed(1)
xy <- rCopula(2500, plackettCopula(param = 3))
y.m1 <- qlogSN2(xy[,1], mu = 1, sigma = 0.75, nu = 0.5)
y.m2 <- qlogSEP4(xy[,2], mu = 0, sigma = 1.2, nu = 2.4, tau = 1)

## Estimates the model
n <- length(y.m1)
y <- c(y.m1, y.m2)
b <- gamlss2(eq.lst, data = data.frame(y = y), family = copula,
	control = gamlss2_control(maxit = c(1000, 10)))

## Validation below
predict(b)[1,]

## Plots log-density of this copula
plot.copula(m1.mu = 1, m1.sigma = 0.75, m1.nu = 0.5,
	m2.mu = 0, m2.sigma = 1.2, m2.nu = 2.4, m2.tau = 1,
	theta = 3, log = TRUE, plot = TRUE)
}}

