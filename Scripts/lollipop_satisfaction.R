# Bar plot and lollipop of Expenses of CFW

#Create dataframe
library(ggplot2)

satisfaction_data <- data.frame(
  item = c("Overall satisfaction with the pilot", "Hours worked", "Workload", 
           "Safety", "Working environment", "Compensation"),
  satisfaction = c(100, 100, 89, 89, 89, 67)
)


#Simple barplot
ggplot(satisfaction_data, aes(x = reorder(item, satisfaction), y = satisfaction)) +
  geom_bar(stat = "identity", fill = "#f8485e") +
  labs(x = "", y = "") +
  coord_flip() +
  theme_minimal()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(face = "bold", size = 10),
        axis.text.y = element_text(face = "bold", size = 10))

#Lollipop
ggplot(satisfaction_data, aes(x = reorder(item, satisfaction), y = satisfaction)) +
  geom_segment(aes(xend = reorder(item, satisfaction), yend = 0), color = "#61c2a2") +
  geom_point(size = 4.5, color = "#61c2a2") +
  geom_text(aes(label = paste0(satisfaction, "%")), 
            vjust = -1,  # Adjust vertical position of the text
            size = 3.5, fontface = "bold") + 
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