#' Get list of projects
#'
#' @param endpoint api endpoint url
#' @param username username
#' @param password password
#'
#' @importFrom httr GET authenticate progress content
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' ktb_projects_list(endpoint = "https://kc.humanitarianresponse.info/api/v1/",
#'                   username = Sys.getenv("KTB_USER"),
#'                   password = Sys.getenv("KTB_PWD"))
#' }
ktb_projects_list <- function(endpoint, username, password){
  GET(url = paste0(endpoint, "data.csv"),
      authenticate(user = username,
                   password = password)
  ) |>
    content(type = "text/csv", encoding = "UTF-8", show_col_types = ",")
}

#' Get data of project
#'
#' @param endpoint api endpoint url
#' @param project_id project id
#' @param username username
#' @param password password
#'
#' @importFrom httr GET authenticate progress content
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' ktb_project_data(endpoint = "https://kc.humanitarianresponse.info/api/v1/",
#'                  project_id = 1,
#'                  username = Sys.getenv("KTB_USER"),
#'                  password = Sys.getenv("KTB_PWD")
#' )
#' }
ktb_project_data <- function(endpoint, project_id, username, password){
  GET(url = paste0(endpoint, "data/", project_id, ".csv"),
      authenticate(user = username,
                   password = password)
  ) |>
    content(type = "text/csv", encoding = "UTF-8", show_col_types = ",")
}
