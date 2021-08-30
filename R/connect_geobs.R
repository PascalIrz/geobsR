#' Se connecter à Géobs
#'
#' @param url Caractères. URL du site. Par défaut, "https://geobs.eaufrance.fr/geobs/login.htm".
#' @param id Caractères. Identifiant de connexion (en général l'adresse email).
#' @param mdp Caractère. Mot de passe.
#'
#' @return La connexion de la session
#' @export
#'
#' @importFrom rvest session html_form html_form_set session_submit
#'
#' @examples \dontrun{
#' connect_geobs(
#' id = 'john.doe@ofb.gouv.fr',
#' mdp = 'mon_mot_de_passe'
#' )
#' }

connect_geobs <- function(url = "https://geobs.eaufrance.fr/geobs/login.htm", id, mdp)

  {

  session <- session(url)

  form <- rvest::html_form(session)[[1]]

  filled_form <- rvest::html_form_set(form,
                               `j_username` = id,
                               `j_password` = mdp)

  rvest::session_submit(session, filled_form)

}



