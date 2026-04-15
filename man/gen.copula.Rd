\name{gen.copula}
\alias{gen.copula}

\title{A function to generate appropriate functions to be used to fit a bivariate copula in GAMLSS}
\description{
	The \code{gen.copula()} function allows the user to generate a \code{d}, \code{p}, \code{q}, \code{p2c1}, \code{q2c1} , \code{plot} and fitting \code{gamlss} functions for bivariate copulas.
	The function can take any \code{\link[gamlss.dist]{gamlss.family}} distribution.
}
\usage{
	gen.copula(m1 = "NO", m2 = "NO", copula = "NO",
		name = NULL, print = TRUE)
}

\arguments{
	\item{m1}{character, a \code{\link[gamlss.dist]{gamlss.family}} distribution, which is 
		used to define the first marginal distribution.
		The distribution families supported by \code{gamlss2()} can be found in \code{\link[gamlss.dist]{gamlss.family}} and in the package \code{gamlss.dist}.}
	\item{m2}{character, a \code{\link[gamlss.dist]{gamlss.family}} distribution, which is 
		used to define the second marginal distribution.}
	\item{copula}{character, a copula family. For currently supported families, see details.}
	\item{name}{character, the name of the new functions. The default is a concatenation of \code{m1}, \code{m2} and \code{copula}.}
	\item{print}{boolean, whether to print the function execution (TRUE) or not (FALSE)}
}

\value{
  Returns the \code{d} (i.e., probability density function [pdf]), \code{p} (i.e., cumulative distribution function [cdf]), \code{r} (i.e., random sample generator),
	\code{p2c1} (i.e., cdf of the second marginal given the first marginal), \code{q2c1} (i.e., inverse cdf of the second marginal given the first marginal),
	\code{plot}, and the fitting function used for \code{gamlss2()}.
}

\details{
	Copulas can have positive dependence [pd], negative dependence [nd], or both.

	The currently supported one-parameter copula families are: 
	\itemize{
		\item \code{NO}: Gaussian (normal) copula [pd/nd]
		\item \code{PL}: Plackett copula [pd/nd]
		\item \code{FR}: Frank copula [pd/nd]
		\item \code{MTCJ}: Mardia-Takahasi-Clayton-Cook-Johnson copula [pd]
		\item \code{JOE}: Joe copula [pd]
		\item \code{GU}: Gumbel copula [pd]
		\item \code{GAL}: Galambos copula [pd]
		\item \code{HR}: Husler-Reiss copula [pd]
		\item \code{FGM}: Farlie-Gumbel-Morgenstern copula [pd/nd]
	}
	The currently supported two-parameter copula families are: 
	\itemize{
		\item \code{T}: Student copula [pd/nd]
		\item \code{BB1}: BB1 copula [pd]
	}
	
	For a fitted gamlss2 model with a bivariate copula family, five types of quantile
	residuals are available and can be selected with the \code{id} parameter:
	\itemize{
		\item (\code{id = 1}) First marginal
		\item (\code{id = 2}) Second marginal
		\item (\code{id = 3}) Second marginal conditional on first marginal
		\item (\code{id = 4}) Chi-square distribution with two degrees of freedom induced by p, p = res(id=1)^2 + res(id=3)^2
		\item (\code{id = 5}, default) Joint residuals, according to Equation 5 of Kalliovirta (2008)
	}
	If \code{id = 0} is used, all the five options above will be returned in a matrix format.
}

\references{
	Kalliovirta, L. (2008). \emph{Quantile residuals for multivariate models}. Helsinki Center of
	Economic Research Discussion Papers, 247.

	Joe, H. (2023). \emph{Dependence Modeling with Copulas}. CRC Press. ISBN 978-1032477374.

	Stasinopoulos D. M., Rigby R.A., Heller G., Voudouris V., and De Bastiani F., (2017)
	\emph{Flexible Regression and Smoothing: Using GAMLSS in R},  Chapman and Hall/CRC.  
	(see also \url{https://www.gamlss.com/}).
}
\author{Arthur Fendrich \email{arthur.fendrich@ec.europa.eu}, Elise Van Eynde, Mikis Stasinopoulos and Bob Rigby}

\examples{\dontrun{
library(gamlss2)
library(gamlss.dist)
library(gamlss2.copula)

## Generates one log- and one logit-modified families
gen.Family('NO', type = 'logit')
gen.Family('PE', type = 'log')

## Generates the bivariate copula
gen.copula('logitNO', 'logPE', 'FR', name = 'copula')

## Plots log-density of this copula
plot.copula(m1.mu = 0, m1.sigma = 0.5,
	m2.mu = 2, m2.sigma = 0.1, m2.nu = 2,
	theta = 3, log = TRUE, plot = TRUE)
}}
\keyword{distribution}
\keyword{regression}
\keyword{bivariate}
\keyword{copula}
