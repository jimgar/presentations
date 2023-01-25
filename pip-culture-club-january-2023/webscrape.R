# Gets web pages ready for scraping.
# This script was run Tue 22nd Jan 2023.

links <- c(paste0("https://www.teamblind.com/company/Twitter/reviews?page=", rep(1:30)))

scraped_pages <- purrr::map(links, rvest::read_html)

purrr::iwalk(
  scraped_pages, 
  ~ xml2::write_html(.x, paste0("pages/", if (.y < 10) paste0(0, .y) else (.y), ".html"))
)
