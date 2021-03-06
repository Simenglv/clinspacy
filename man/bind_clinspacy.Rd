% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clinspacy.R
\name{bind_clinspacy}
\alias{bind_clinspacy}
\title{This function binds columns containing either the lemma of the entity or the
UMLS concept unique identifier (CUI) with frequencies to a data frame. The
resulting data frame can be used to train a machine learning model or for
additional feature selection.}
\usage{
bind_clinspacy(
  clinspacy_output,
  df,
  cs_col = NULL,
  df_id = NULL,
  subset = "is_negated == FALSE"
)
}
\arguments{
\item{clinspacy_output}{A data.frame or file name containing the output from
\code{\link{clinspacy}}.}

\item{df}{The data.frame to which you would like to bind the output of
\code{\link{clinspacy}}.}

\item{cs_col}{Name of the column in the \code{clinspacy_output} that you
would like to pivot. For example: \code{"entity"}, \code{"lemma"},
\code{"cui"}, or \code{"definition"}. Defaults to \code{"lemma"} if
\code{use_linker} is set to \code{FALSE} and \code{"cui"} if
\code{use_linker} is set to \code{TRUE}.}

\item{df_id}{The name of the \code{id} column in the data frame with which
the \code{id} column in \code{clinspacy_output} will be joined. If you
supplied a \code{df_id} in \code{\link{clinspacy}}, then you must also
supply it here. If you did not supply it in \code{\link{clinspacy}}, then
it will default to the row number (similar behavior to in
\code{\link{clinspacy}}).}

\item{subset}{Logical criteria represented as a string by which the
\code{clinspacy_output} will be subsetted prior to building the output data
frame. Defaults to \code{"is_negated == FALSE"}, which removes negated
concepts prior to generating the output. Any column in
\code{clinspacy_output} may be referenced here. To avoid any subsetting,
set this to \code{NULL}.}
}
\value{
A data frame containing the original data frame as well as additional
  column names for each lemma or UMLS concept unique identifer found with
  values containing frequencies.
}
\description{
This function binds columns containing either the lemma of the entity or the
UMLS concept unique identifier (CUI) with frequencies to a data frame. The
resulting data frame can be used to train a machine learning model or for
additional feature selection.
}
\examples{
mtsamples <- dataset_mtsamples()
mtsamples[1:5,] \%>\%
  clinspacy(df_col = 'description') \%>\%
  bind_clinspacy(mtsamples[1:5,])

}
