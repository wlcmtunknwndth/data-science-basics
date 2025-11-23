# Лабораторная работа №3

# -------------------------------------------------------------------------------------
# 1. Создание вектора state и работа с факторами

# Создаем вектор state с 5 элементами
state <- c("prof", "prof", "docent", "docent", "assist")
print("Вектор state:")
print(state)

# Выделяем различные категории (факторы) в векторе state
state_factor <- factor(state)
print("Фактор state:")
print(state_factor)

# Отображаем отдельно эти категории (уровни)
print("Уровни фактора state:")
print(levels(state_factor))

# Задаем вектор доходов
income <- c(60, 59, 40, 42, 23)
print("Вектор доходов:")
print(income)

# Находим средние доходы для каждой категории с помощью функции tapply
mean_income <- tapply(income, state_factor, mean)
print("Средние доходы для каждой категории:")
print(mean_income)

# Определяем еще одну категорию "st.prep" в дополнение к уже исследованным
# Добавляем новый уровень к фактору
levels(state_factor) <- c(levels(state_factor), "st.prep")
print("Фактор state с добавленной категорией st.prep:")
print(state_factor)
print("Обновленные уровни фактора:")
print(levels(state_factor))

# Выводим таблицу статистики для всех категорий
# Создаем сводную таблицу с основными статистиками
stats_table <- tapply(income, state_factor, function(x) {
  c(
    Количество = length(x),
    Среднее = mean(x),
    Медиана = median(x),
    Стандартное_отклонение = sd(x),
    Минимум = min(x),
    Максимум = max(x)
  )
})

print("Таблица статистики для всех категорий:")
# Преобразуем список в удобочитаемую таблицу
stats_df <- as.data.frame(do.call(rbind, stats_table))
print(stats_df)

# -------------------------------------------------------------------------------------
# 2. Работа со списками

# Создаем список x с тремя компонентами разных типов
x <- list(
  a = 1:10,                    # числовой вектор 1,2,...,10
  beta = exp(-3:3),            # экспоненты: exp(-3), exp(-2), ..., exp(3)
  logic = c(TRUE, FALSE, FALSE, TRUE)  # логический вектор
)

print("Список x:")
print(x)

# Выводим содержимое третьей компоненты списка двумя способами
print("Третья компонента по имени:")
print(x$logic)

print("Третья компонента по индексу:")
print(x[[3]])

# Различие между x[1] и x[[1]]
print("x[1] (возвращает подсписок):")
print(x[1])
print(class(x[1]))

print("x[[1]] (возвращает содержимое компоненты):")
print(x[[1]])
print(class(x[[1]]))

# Находим среднее арифметическое значений каждой компоненты списка x
print("Средние арифметические:")
# Для числовой компоненты
mean_a <- mean(x$a)
print(paste("Среднее компоненты 'a':", mean_a))

# Для экспоненциальной компоненты
mean_beta <- mean(x$beta)
print(paste("Среднее компоненты 'beta':", mean_beta))

# Для логической компоненты (TRUE=1, FALSE=0)
mean_logic <- mean(x$logic)
print(paste("Среднее компоненты 'logic':", mean_logic))

# Добавляем к списку x четвертую компоненту - последовательность первых 10 букв
x$letters <- letters[1:10]
print("Список x с добавленной компонентой 'letters':")
print(x)

# Создаем новый список y на основании старого x двумя способами

# Способ 1: используя индексы
y1 <- list(
  comp1 = x$a,
  comp2 = x$beta,
  comp3 = x$logic,
  comp4 = x$letters
)
print("Список y1 (через индексы):")
print(y1)

# Способ 2: с помощью операции конкатенации
y2 <- c(x[1], x[2], x[3], x[4])
print("Список y2 (через конкатенацию):")
print(y2)

# Используем y1 для дальнейших операций
y <- y1

# Преобразуем список y в вектор z
z <- unlist(y)
print("Вектор z (результат unlist(y)):")
print(z)

# Определяем класс данных и тип объектов вектора z
print("Класс данных вектора z:")
print(class(z))

print("Тип объектов в векторе z:")
print(typeof(z))

# Анализируем, что было бы, если бы y был образован из компонент 1 и 3 списка x
y_alt <- list(comp1 = x$a, comp3 = x$logic)
z_alt <- unlist(y_alt)
print("Вектор z_alt (из компонент 1 и 3 списка x):")
print(z_alt)
print("Тип объектов в векторе z_alt:")
print(typeof(z_alt))

# Преобразуем список y в таблицу данных (data.frame)
# Для этого все компоненты должны быть одинаковой длины
# Создаем новый список с компонентами одинаковой длины
y_equal <- list(
  numbers = 1:4,
  exp_values = exp(1:4),
  logicals = c(TRUE, FALSE, TRUE, FALSE),
  chars = letters[1:4]
)

df <- as.data.frame(y_equal)
print("Таблица данных (data.frame) из списка:")
print(df)
print("Структура таблицы:")
print(str(df))

# -------------------------------------------------------------------------------------
# 3. Работа с таблицами данных (data.frame)

# Создаем таблицу данных с информацией о студентах
students_data <- data.frame(
  фамилия = c("Иванов", "Петров", "Сидоров", "Кузнецов", "Смирнов"),
  год_рождения = c(2000, 2001, 2000, 2002, 2001),
  год_поступления = c(2018, 2019, 2018, 2020, 2019),
  stringsAsFactors = FALSE
)

# Сортируем фамилии в лексикографическом порядке
students_data <- students_data[order(students_data$фамилия), ]
rownames(students_data) <- NULL  # Сбрасываем номера строк

print("Исходная таблица данных:")
print(students_data)

# Добавляем два новых столбца
students_data$задолженность <- c("нет", "математика", "физика", "нет", "информатика")
students_data$курс <- c(NA, 2, 1, NA, 3)

print("Таблица с добавленными столбцами:")
print(students_data)

# Определяем размерность таблицы
print("Размерность таблицы:")
print(dim(students_data))

# Поиск самого молодого и самого старого студентов
min_year <- min(students_data$год_рождения)
max_year <- max(students_data$год_рождения)

# Номера самых молодых студентов
youngest_indices <- which(students_data$год_рождения == max_year)
print("Номера самых молодых студентов:")
print(youngest_indices)

# Номера самых старых студентов
oldest_indices <- which(students_data$год_рождения == min_year)
print("Номера самых старых студентов:")
print(oldest_indices)

# Фамилии самых старых студентов
oldest_students <- students_data$фамилия[oldest_indices]
print("Фамилии самых старых студентов:")
print(oldest_students)

# Фамилии самых молодых студентов
youngest_students <- students_data$фамилия[youngest_indices]
print("Фамилии самых молодых студентов:")
print(youngest_students)

# Запись таблицы в файлы разными способами

# Способ 1: write.table
write.table(students_data, "table1.txt", row.names = FALSE, sep = "\t")
print("Таблица записана в table1.txt")

# Способ 2: write.csv
write.csv(students_data, "table2.csv", row.names = FALSE)
print("Таблица записана в table2.csv")

# Чтение записанных файлов
table1_read <- read.table("table1.txt", header = TRUE, sep = "\t")
print("Прочитано из table1.txt:")
print(table1_read)

table2_read <- read.csv("table2.csv")
print("Прочитано из table2.csv:")
print(table2_read)

# Работа с Excel файлами
if (!require(openxlsx)) {
  install.packages("openxlsx")
  library(openxlsx)
}

# Запись в Excel файл
wb <- createWorkbook()

# Первый лист - полная таблица
addWorksheet(wb, "Студенты")
writeData(wb, "Студенты", students_data)

# Второй лист - только фамилии в алфавитном порядке
addWorksheet(wb, "Фамилии")
surnames_sorted <- sort(students_data$фамилия)
writeData(wb, "Фамилии", data.frame(Фамилия = surnames_sorted))

# Сохраняем книгу
saveWorkbook(wb, "book.xlsx", overwrite = TRUE)
print("Таблица записана в book.xlsx")

# Чтение из Excel файла
excel_data <- read.xlsx("book.xlsx", sheet = "Студенты")
print("Прочитано из book.xlsx:")
print(excel_data)

# Дополнительная информация о таблице
print("Сводная информация о таблице:")
print(summary(students_data))

print("Структура таблицы:")
print(str(students_data))

# -------------------------------------------------------------------------------------
# 4. Анализ данных о погодных условиях

airquality <- read.csv('~/dev/university/4-1/data-science-basics/lab03/airquality.csv')

# Создаем таблицу данных w_data из встроенного набора
w_data <- airquality

print("Таблица данных w_data:")
print(head(w_data))
print(paste("Размерность таблицы:", paste(dim(w_data), collapse = " x ")))

# Сколько всего наблюдений (по дням) содержится в таблице данных?
total_observations <- nrow(w_data)
print(paste("Всего наблюдений (по дням):", total_observations))

# Извлекаем первые 2 строки
first_2_rows <- head(w_data, 2)
print("Первые 2 строки:")
print(first_2_rows)

# Извлекаем последние 2 строки
last_2_rows <- tail(w_data, 2)
print("Последние 2 строки:")
print(last_2_rows)

# Значение параметра Ozone в 47 строке
ozone_47 <- w_data$Ozone[47]
print(paste("Значение Ozone в 47 строке:", ozone_47))

# Количество пропущенных значений (NA) в столбце Ozone
na_ozone <- sum(is.na(w_data$Ozone))
print(paste("Количество пропущенных значений в столбце Ozone:", na_ozone))

# Среднее значение параметра Ozone, исключив пропущенные значения
mean_ozone <- mean(w_data$Ozone, na.rm = TRUE)
print(paste("Среднее значение Ozone (без NA):", round(mean_ozone, 2)))

# Подмножество строк: Ozone > 31 и Temp > 90
subset_data <- subset(w_data, Ozone > 31 & Temp > 90)
print("Подмножество (Ozone > 31 и Temp > 90):")
print(subset_data)

# Среднее значение Solar.R в новой выборке
mean_solar_subset <- mean(subset_data$Solar.R, na.rm = TRUE)
print(paste("Среднее значение Solar.R в выборке (Ozone > 31 и Temp > 90):", round(mean_solar_subset, 2)))

# Среднее значение Temp, когда Month равен 6
mean_temp_june <- mean(w_data$Temp[w_data$Month == 6], na.rm = TRUE)
print(paste("Среднее значение Temp в июне (Month = 6):", round(mean_temp_june, 2)))

# Максимальное значение Ozone в мае месяце
max_ozone_may <- max(w_data$Ozone[w_data$Month == 5], na.rm = TRUE)
print(paste("Максимальное значение Ozone в мае (Month = 5):", max_ozone_may))

