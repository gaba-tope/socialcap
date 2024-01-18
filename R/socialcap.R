#' Enhances ggplot2 Visualizations with Social Media Handles and Icons via ggtext
#'
#' `socialcap()` returns your social media info in string.
#' The returned string is to be an argument to `caption` parameter of `labs()` for ggplot2 system.
#' Currently, github, twitter, facebook, linkedin, discord accounts are supported for now.
#'
#' The returned string should be in its Markdown/HTML/CSS language. In order to apply the string into your plots,
#'  the following conditions should be met:
#' * Package {ggtext} should be loaded.
#' * Package {ggplot2} should be loaded, and your plot should be made with `ggplot()`.
#' * The theme element of the caption should be `plot.caption = element_textbox_simple()` or `plot.caption = element_textbox()`.
#'
#' @param gitname Username of Github Repository in string
#' @param twitname Username of Twitter in string
#' @param facebkname Username of Facebook in string
#' @param linkedname Username of LinkedIn in string
#' @param discdname Username of Discord in string
#' @param iconcol Color code for social media icon in string
#' @param textcol Color code for username text in string
#' @param textfont Font family for username text in string. Font with this family name should have been loaded in advance.
#' @param iconpath Path where 'Font Awesome Brands' font files are located, in string
#' @returns A string of social media icon and username in HTML format.
#'
#' @export
socialcap <- function(gitname = "", twitname = "", facebkname = "",
                      linkedname = "", discdname = "",
                      iconcol = "#E30b5c",
                      textcol = "grey10",
                      textfont = "oswald",
                      iconpath = "./Font-Awesome-6-Brands-Regular-400.otf"
                      ){
  tryCatch(sysfonts::font_add(family = "Font_Awesome_6_Brands_reg", # Social media icon fonts
                     regular = iconpath),
           error = function(e) message("An error occurred while loading the font for icon:\n", e)
  )

  # Message if the textfont is not loaded in the current session:
  loaded_families <- sysfonts::font_families()
  if (!(textfont %in% loaded_families)) {
    message_text <- glue::glue("NOTE: text_font '{textfont}' familiy is not loaded. Make sure the font family is loaded
          before calling ggplot().")
    message(message_text)
  }

  showtext::showtext_auto()

  # Github Info
  github_icon <- "&#xf09b" #unicode f09b, used for HTML so &#x added.
  github_username <- gitname
  github_caption <- glue::glue("<span style='color: {iconcol};font-family:\"Font_Awesome_6_Brands_reg\";'>{github_icon};</span> <span style='color: {textcol}; font-family:\"{textfont}\";'>{github_username}</span>")

  # Twitter Info
  twit_icon <- "&#xf099"
  twit_username <- twitname
  twit_caption <- glue::glue("<span style='color: {iconcol};font-family:\"Font_Awesome_6_Brands_reg\";'>{twit_icon};</span> <span style='color: {textcol}; font-family:\"{textfont}\";'>{twit_username}</span>")

  # Facebook Info
  facebk_icon <- "&#xf09a"
  facebk_username <- facebkname
  facebk_caption <- glue::glue("<span style='color: {iconcol};font-family:\"Font_Awesome_6_Brands_reg\";'>{facebk_icon};</span> <span style='color: {textcol}; font-family:\"{textfont}\";'>{facebk_username}</span>")

  # LinkedIn Info
  linked_icon <- "&#xf08c"
  linked_username <- linkedname
  linked_caption <- glue::glue("<span style='color: {iconcol};font-family:\"Font_Awesome_6_Brands_reg\";'>{linked_icon};</span> <span style='color: {textcol}; font-family:\"{textfont}\";'>{linked_username}</span>")

  # Discord Info
  discd_icon <- "&#xf392"
  discd_username <- discdname
  discd_caption <- glue::glue("<span style='color: {iconcol};font-family:\"Font_Awesome_6_Brands_reg\";'>{discd_icon};</span> <span style='color: {textcol}; font-family:\"{textfont}\";'>{discd_username}</span>")

  # df for brand selection
  brand_df <- data.frame(Brand = c("github", "twit", "facebk", "linked", "discd"),
                  Name = c(github_username, twit_username, facebk_username,
                           linked_username, discd_username),
                  Caption = c(github_caption, twit_caption, facebk_caption,
                              linked_caption, discd_caption),
                  Include = vector(length = 5))
  brand_df <- dplyr::mutate(brand_df,
                            Include = ifelse(.data$Name == "", 0, 1))

  print_df <- dplyr::filter(brand_df, .data$Include == 1)
  num_row <- nrow(print_df)

  social_caption <- print_df[1:num_row, 3]
  social_caption_print <- paste(social_caption, collapse = " ")

  cat("------- Caption Generated -------\n")
  return(social_caption_print)
}
