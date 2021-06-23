# Read Files
data_OG <- read_excel("data/dota2/OG_route_to_2TI.xlsx", sheet = "OG")

df_OG_message <- data_OG %>%
  mutate(TI = paste0("TI", TI)) %>%
  mutate(TI_Round_Type = paste(TI, Type, Round, sep = "_")) %>%
  mutate("Result Summary" = paste0(Win, "-", Lose, " vs ", Team)) %>%
  select(TI_Round_Type, Result, `Result Summary`)

df_OG_teams <- data_OG %>%
  group_by(Team) %>%
  summarise(Won = sum(Win), 
            Lost = sum(Lose),
            Series = n(), .groups = "drop") %>%
  mutate(Played = Won + Lost) %>%
  mutate("Win Rate" = paste0(round(Won/Played*100, 2), "%")) %>%
  arrange(desc(Played))