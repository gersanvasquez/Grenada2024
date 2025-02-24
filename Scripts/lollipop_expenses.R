# Bar plot and lollipop of Expenses of CFW

#Create dataframe
library(ggplot2)
spending <- data.frame(
  category = c("Food", "Education", "Transportation", "Cellphone", "Household reparation", "Clothing", "Savings", "Household items", "Health", "Utilities", "Other"),
  frequency = c(5, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2)
)


#Simple barplot
ggplot(spending, aes(x = reorder(category, frequency), y = frequency)) +
  geom_bar(stat = "identity", fill = "#f8485e") +
  labs(x = "", y = "") +
  coord_flip() +
  theme_minimal()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(face = "bold", size = 10),
        axis.text.y = element_text(face = "bold", size = 10))

#Lollipop
ggplot(spending, aes(x = reorder(category, frequency), y = frequency)) +
  geom_segment(aes(xend = reorder(category, frequency), yend = 0), color = "#f8485e") +
  geom_point(size = 4, color = "#f8485e") +
  labs(x = "", y = "") +
  coord_flip() +
  theme_minimal() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(face = "bold", size = 10),
        axis.text.y = element_text(face = "bold", size = 10))


#Lollipop with different colors for top categories

# Assigning colors: for Food, Education, and Transportation, and for the others
spending$color <- ifelse(spending$category %in% c("Food", "Transportation", "Education"), "#f8485e", "#fcb4bd")

#lollipop
ggplot(spending, aes(x = reorder(category, frequency), y = frequency)) +
  geom_segment(aes(xend = reorder(category, frequency), yend = 0, color = color), size = 1) +  # Use color mapping for lines
  geom_point(aes(color = color), size = 4) +  # Use color mapping for points
  scale_color_identity() +  # Keep the colors as specified in the 'color' column
  labs(x = "", y = "") +
  coord_flip() +
  theme_minimal() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(face = "bold", size = 10),
        axis.text.y = element_text(face = "bold", size = 10))