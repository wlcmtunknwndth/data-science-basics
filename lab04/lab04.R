# Лабораторная работа № 4. Графика в R

# -------------------------------------------------------------------------------------
# 1. Построение графиков функции y = sin(x) с разными параметрами type

# Создаем вектор x значений от -2π до 2π
x <- seq(-2*pi, 2*pi, length.out = 100)
y <- sin(x)

# Устанавливаем параметры для отображения нескольких графиков в одном окне
par(mfrow = c(2, 3))  # 2 строки, 3 столбца

# 1. type = "p" - точки
plot(x, y, type = "p", main = 'type = "p" (точки)', 
     xlab = "x", ylab = "sin(x)", col = "blue", pch = 16)

# 2. type = "l" - линии
plot(x, y, type = "l", main = 'type = "l" (линии)', 
     xlab = "x", ylab = "sin(x)", col = "red", lwd = 2)

# 3. type = "b" - и точки, и линии
plot(x, y, type = "b", main = 'type = "b" (точки и линии)', 
     xlab = "x", ylab = "sin(x)", col = "green", pch = 16, lwd = 1)

# 4. type = "o" - точки поверх линий
plot(x, y, type = "o", main = 'type = "o" (точки поверх линий)', 
     xlab = "x", ylab = "sin(x)", col = "purple", pch = 16, lwd = 1)

# 5. type = "h" - вертикальные линии (гистограмма)
plot(x, y, type = "h", main = 'type = "h" (вертикальные линии)', 
     xlab = "x", ylab = "sin(x)", col = "orange", lwd = 2)

# 6. type = "s" - ступенчатая функция
plot(x, y, type = "s", main = 'type = "s" (ступенчатая)', 
     xlab = "x", ylab = "sin(x)", col = "brown", lwd = 2)

# Восстанавливаем стандартные параметры графики
par(mfrow = c(1, 1))

# Дополнительно: все типы на одном графике для сравнения
plot(x, y, type = "n", main = "Все типы графиков функции y = sin(x)", 
     xlab = "x", ylab = "sin(x)", ylim = c(-1.5, 1.5))

# Добавляем каждый тип линий с разными цветами
lines(x, y, type = "p", col = "blue", pch = 1)
lines(x, y, type = "l", col = "red", lwd = 2)
lines(x, y, type = "b", col = "green", pch = 16)
lines(x, y, type = "o", col = "purple", pch = 17)
lines(x, y, type = "h", col = "orange")
lines(x, y, type = "s", col = "brown", lwd = 2)

# Добавляем легенду
legend("topright", 
       legend = c('"p" - точки', '"l" - линии', '"b" - точки и линии', 
                  '"o" - точки поверх линий', '"h" - вертикальные линии', '"s" - ступенчатая'),
       col = c("blue", "red", "green", "purple", "orange", "brown"),
       lty = 1, lwd = 2, cex = 0.8)

# -------------------------------------------------------------------------------------
# 2. Построение графиков функции y = sin(x) с разными параметрами lty (тип линии)

# Создаем вектор x значений от -2π до 2π
x <- seq(-2*pi, 2*pi, length.out = 100)
y <- sin(x)

# Устанавливаем параметры для отображения нескольких графиков в одном окне
par(mfrow = c(2, 3))  # 2 строки, 3 столбца

# 1. lty = 1 - сплошная линия
plot(x, y, type = "l", lty = 1, main = 'lty = 1 (сплошная)', 
     xlab = "x", ylab = "sin(x)", col = "blue", lwd = 2)

# 2. lty = 2 - пунктирная линия
plot(x, y, type = "l", lty = 2, main = 'lty = 2 (пунктирная)', 
     xlab = "x", ylab = "sin(x)", col = "red", lwd = 2)

# 3. lty = 3 - точечная линия
plot(x, y, type = "l", lty = 3, main = 'lty = 3 (точечная)', 
     xlab = "x", ylab = "sin(x)", col = "green", lwd = 2)

# 4. lty = 4 - пунктирно-точечная
plot(x, y, type = "l", lty = 4, main = 'lty = 4 (пунктирно-точечная)', 
     xlab = "x", ylab = "sin(x)", col = "purple", lwd = 2)

# 5. lty = 5 - длинная пунктирная
plot(x, y, type = "l", lty = 5, main = 'lty = 5 (длинная пунктирная)', 
     xlab = "x", ylab = "sin(x)", col = "orange", lwd = 2)

# 6. lty = 6 - комбинированная
plot(x, y, type = "l", lty = 6, main = 'lty = 6 (комбинированная)', 
     xlab = "x", ylab = "sin(x)", col = "brown", lwd = 2)

# Восстанавливаем стандартные параметры графики
par(mfrow = c(1, 1))

# Добавляем легенду
legend("topright", 
       legend = c('lty = 1 (сплошная)', 'lty = 2 (пунктирная)', 'lty = 3 (точечная)',
                  'lty = 4 (пунктирно-точечная)', 'lty = 5 (длинная пунктирная)', 
                  'lty = 6 (комбинированная)'),
       col = 1:6, lty = 1:6, lwd = 2, cex = 0.8)

# -------------------------------------------------------------------------------------
# 3. Построение графиков с использованием функции split.screen() и разным цветом фона

# Создаем вектор x значений от -2π до 2π
x <- seq(-2*pi, 2*pi, length.out = 100)
y <- sin(x)

# Определяем цвета фона для каждого подокна
background_colors <- c("lightblue", "lightgreen", "lightyellow", "lightpink", "lavender", "lightcyan")

# Разделяем экран на 6 частей (2 строки, 3 столбца)
split.screen(c(2, 3))

# Создаем графики в каждом подокне с разным фоном
for (i in 1:6) {
  screen(i)
  
  # Устанавливаем цвет фона
  par(bg = background_colors[i])
  
  # Создаем график с разным типом линии
  plot(x, y, type = "l", lty = i, 
       main = paste("lty =", i, "-", background_colors[i]),
       xlab = "x", ylab = "sin(x)", 
       col = "darkblue", lwd = 2,
       panel.first = {
         # Добавляем сетку для лучшей читаемости
         grid()
         # Добавляем ось x
         abline(h = 0, col = "gray50", lwd = 1)
       })
}

# Закрываем разделение экрана
close.screen(all.screens = TRUE)

# Дополнительный пример: разделение экрана неравномерно
cat("\nДополнительный пример с неравномерным разделением экрана:\n")

# Разделяем экран на 4 неравные части
split.screen(c(2, 2))
split.screen(c(1, 2), screen = 2)  # Делим второе подокно еще на 2 части

# Цвета фона для неравномерного разделения
bg_colors_uneven <- c("coral", "gold", "palegreen", "plum", "wheat")

# Создаем графики в каждом подокне
screen(1)
par(bg = bg_colors_uneven[1])
plot(x, y, type = "l", lty = 1, main = "Экран 1", xlab = "x", ylab = "sin(x)", col = "darkred", lwd = 2)

screen(3)
par(bg = bg_colors_uneven[2])
plot(x, y, type = "l", lty = 2, main = "Экран 3", xlab = "x", ylab = "sin(x)", col = "darkgreen", lwd = 2)

screen(4)
par(bg = bg_colors_uneven[3])
plot(x, y, type = "l", lty = 3, main = "Экран 4", xlab = "x", ylab = "sin(x)", col = "darkblue", lwd = 2)

screen(5)
par(bg = bg_colors_uneven[4])
plot(x, y, type = "l", lty = 4, main = "Экран 5", xlab = "x", ylab = "sin(x)", col = "purple", lwd = 2)

# -------------------------------------------------------------------------------------
# 4. Построение графика функции с математическими обозначениями и настройкой осей

# Создаем вектор x значений
x <- seq(0.1, 4*pi, length.out = 200)

# Вычисляем значения функции y = x^2 * sin(1/x)
y <- x^2 * sin(1/x)

# Настраиваем параметры графики для правильного отображения математических символов
par(mar = c(5, 6, 4, 2) + 0.1)  # Увеличиваем отступы для осей

# Создаем основной график
plot(x, y, type = "l", 
     main = expression(y == x^2 %.% sin(1/x)),  # Математическое обозначение в заголовке
     xlab = expression(x),                      # Математическое x
     ylab = expression(y == x^2 %.% sin(1/x)),  # Математическое обозначение для оси y
     col = rgb(1, 0, 0),                       # Красный цвет в RGB (1,0,0)
     lwd = 2,
     frame.plot = TRUE,                         # Включаем рамку
     fg = "green",                              # Зеленый цвет рамки
     cex.lab = 1.2,                             # Увеличиваем размер шрифта подписей осей
     cex.main = 1.3,                            # Увеличиваем размер шрифта заголовка
     mgp = c(3.5, 1, 0))                        # Настраиваем расстояние: подписи осей, метки, линия

grid()

# -------------------------------------------------------------------------------------
# 5. Построение графиков в 4 подокнах и сохранение в файл

# Задаем вектор x
x <- c(-2, -1, 0, 1, 2)

# Вычисляем значения функции y = x^2
y <- x^2

# Открываем графическое устройство для сохранения в файл
jpeg("~/dev/university/4-1/data-science-basics/lab04/figure.jpg", width = 10, height = 8, units = "in", res = 300, quality = 100)

# Устанавливаем параметры для 4 подокон
par(mfrow = c(2, 2))
par(mar = c(4, 4, 3, 1))  # Отступы вокруг каждого графика

# 1. График точками
plot(x, y, 
     type = "p",           # Только точки
     main = "График точками (type = 'p')",
     xlab = "x", 
     ylab = "y = x²",
     pch = 16,             # Тип точки (заполненный круг)
     col = "blue",
     cex = 1.5,            # Размер точек
     lwd = 2,
     xlim = c(-2.5, 2.5),
     ylim = c(-1, 5))
grid()

# 2. График линиями
plot(x, y, 
     type = "l",           # Только линии
     main = "График линиями (type = 'l')",
     xlab = "x", 
     ylab = "y = x²",
     col = "red",
     lwd = 2,
     xlim = c(-2.5, 2.5),
     ylim = c(-1, 5))
grid()

# 3. График линиями и точками
plot(x, y, 
     type = "b",           # И линии, и точки
     main = "График линиями и точками (type = 'b')",
     xlab = "x", 
     ylab = "y = x²",
     pch = 17,             # Тип точки (треугольник)
     col = "green",
     lwd = 2,
     cex = 1.2,
     xlim = c(-2.5, 2.5),
     ylim = c(-1, 5))
grid()

# 4. График кривой (сглаженной линией)
# Создаем более плотную сетку для гладкой кривой
x_dense <- seq(-2, 2, length.out = 100)
y_dense <- x_dense^2

plot(x_dense, y_dense, 
     type = "l",           # Гладкая линия
     main = "График кривой (сглаженный)",
     xlab = "x", 
     ylab = "y = x²",
     col = "purple",
     lwd = 2,
     xlim = c(-2.5, 2.5),
     ylim = c(-1, 5))

# Добавляем исходные точки поверх кривой
points(x, y, pch = 18, col = "orange", cex = 1.5)

grid()

dev.off()

# -------------------------------------------------------------------------------------
# 6. Построение графиков функций разными способами

# Задаем вектор x
x <- seq(3, 6, by = 0.1)

# Вычисляем значения функций
y1 <- pi * x   
y2 <- exp(x) * cos(x)

# a) Построение с помощью функции par()
par(mfrow = c(1, 1))  # Один график в окне

plot(x, y1, type = "l", col = "blue", lwd = 2,
     main = "Графики функций (способ a - par())",
     xlab = "x", ylab = "y",
     ylim = range(c(y1, y2)))  # Общий диапазон по y

# Добавляем вторую функцию
lines(x, y2, col = "red", lwd = 2)

# Добавляем легенду
legend("topright", 
       legend = c(expression(y[1] == pi * x), 
                  expression(y[2] == exp(x) * cos(x))),
       col = c("blue", "red"), lwd = 2, lty = 1)

# Добавляем сетку
grid()

cat("Недостаток способа a):\n")
cat("- Ограниченная кастомизация\n")
cat("- Сложность точного позиционирования элементов\n")
cat("- Меньшая гибкость по сравнению с низкоуровневыми функциями\n\n")

# б) Построение с помощью низкоуровневых функций
# Создаем новое графическое окно
dev.new()  # Новое окно для сравнения

# Создаем пустой график с нужными пределами
plot(x, y1, type = "n",
     main = "Графики функций (способ б - низкоуровневые функции)",
     xlab = "x", ylab = "y",
     ylim = range(c(y1, y2)))

# Добавляем сетку ПЕРВОЙ, чтобы она была под графиками
grid()

# Рисуем графики функций
lines(x, y1, col = "blue", lwd = 2, lty = 1)
lines(x, y2, col = "red", lwd = 2, lty = 2)

# Добавляем непрозрачную легенду в верхнем левом углу
legend("topleft",
       legend = c(expression(y[1] == pi * x), 
                  expression(y[2] == exp(x) * cos(x))),
       col = c("blue", "red"), lwd = 2, lty = 1:2,
       bg = "white", box.lwd = 1)  # Непрозрачный фон

# Находим точку пересечения графиков
intersection_index <- which.min(abs(y1 - y2))
x_intersect <- x[intersection_index]
y_intersect <- (y1[intersection_index] + y2[intersection_index]) / 2

# Отмечаем точку пересечения
points(x_intersect, y_intersect, pch = 21, bg = "green", cex = 2, col = "darkgreen")

cat("Координаты точки пересечения:\n")
cat(paste("x =", round(x_intersect, 2), "\n"))
cat(paste("y =", round(y_intersect, 2), "\n\n"))

cat("Нажмите на графике для размещения легенды...\n")
# Размещаем легенду по клику мыши
legend_pos <- locator(1)
legend(legend_pos,
       legend = c(expression(y[1] == pi * x ), 
                  expression(y[2] == exp(x) * cos(x) )),
       col = c("blue", "red"), lwd = 2, lty = 1:2,
       bg = "white", box.lwd = 1)

cat("Нажмите на графике для размещения надписи 'Точка пересечения'...\n")
text_pos <- locator(1)
text(text_pos, labels = "Точка пересечения", pos = 4, col = "darkgreen", font = 2)

cat("Преимущества способа б:\n")
cat("- Полный контроль над порядком рисования элементов\n")
cat("- Возможность интерактивного размещения элементов\n")
cat("- Более гибкая кастомизация\n\n")

# в) Построение с помощью ggplot2
cat("Устанавливаем и загружаем пакет ggplot2...\n")

# Устанавливаем пакет
if (!require(ggplot2)) {
  install.packages("ggplot2")
  library(ggplot2)
}

# Создаем data.frame для ggplot
df <- data.frame(
  x = rep(x, 2),
  y = c(y1, y2),
  function_name = rep(c("y1 = x² - 7x + 10", "y2 = 2x - 5"), each = length(x))
)

# Создаем график с помощью ggplot2
ggplot_plot <- ggplot(df, aes(x = x, y = y, color = function_name)) +
  geom_line(size = 1) +
  labs(title = "Графики функций (способ в - ggplot2)",
       x = "X",  # Меняем название оси X
       y = "Y(X)",  # Меняем название оси Y
       color = "Функции") +
  scale_color_manual(values = c("blue", "red"),
                     labels = c(expression(y[1] == x^2 - 7*x + 10),
                                expression(y[2] == 2*x - 5))) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "top") +
  geom_vline(xintercept = x_intersect, linetype = "dashed", color = "gray") +
  geom_hline(yintercept = y_intersect, linetype = "dashed", color = "gray") +
  annotate("point", x = x_intersect, y = y_intersect, 
           color = "green", size = 3) +
  annotate("text", x = x_intersect, y = y_intersect + 2,
           label = "Точка пересечения", color = "darkgreen", fontface = "bold")

# Выводим график
print(ggplot_plot)
  
