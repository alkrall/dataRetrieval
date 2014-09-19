#' Raw Data Import for Water Quality Portal
#'
#' Imports data from the Water Quality Portal. 
#' This function gets the data from here: \url{http://www.waterqualitydata.us}. There
#' are four required input arguments: siteNumber, parameterCd, startDate, and endDate.
#' parameterCd can either be a USGS 5-digit code, or a characteristic name. The sites can be 
#' either USGS, or other Water Quality Portal offered sites. It is required to use the 'full'
#' site name, such as 'USGS-01234567'. 
#'
#' @param siteNumber string site number. This needs to include the full agency code prefix.
#' @param parameterCd vector of USGS 5-digit parameter code or string of characteristicNames. 
#' Leaving this blank will return all of the measured values during the specified time period.
#' @param startDate string starting date for data retrieval in the form YYYY-MM-DD.
#' @param endDate string ending date for data retrieval in the form YYYY-MM-DD.
#' @param interactive logical Option for interactive mode.  If true, there is user interaction for error handling and data checks.
#' @keywords data import USGS web service
#' @return retval dataframe raw data returned from the Water Quality Portal. Additionally, a POSIXct dateTime column is supplied for 
#' start and end times.
#' @export
#' @import RCurl
#' @seealso \code{\link{getWQPData}}, \code{\link{getWQPSites}}, 
#' \code{\link{getSTORETSampleData}}, \code{\link{retrieveNWISqwData}}, and \code{\link{basicWQPData}}
#' @examples
#' # These examples require an internet connection to run
#' rawSample <- retrieveWQPqwData('USGS-01594440','01075', '1985-01-01', '1985-03-31')
#' rawSampleAll <- retrieveWQPqwData('USGS-05114000','', '1985-01-01', '1985-03-31')
#' rawSampleSelect <- retrieveWQPqwData('USGS-05114000',c('00915','00931'), '1985-01-01', '1985-04-30')
#' rawStoret <- retrieveWQPqwData('WIDNR_WQX-10032762','Specific conductance', '', '')
retrieveWQPqwData <- function(siteNumber,parameterCd,startDate,endDate,interactive=TRUE){

  url <- constructNWISURL(siteNumber,parameterCd,startDate,endDate,"wqp",interactive=interactive)
  retVal <- basicWQPData(url)
  return(retVal)
  
}
