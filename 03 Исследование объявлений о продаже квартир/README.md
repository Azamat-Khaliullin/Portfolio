# Исследование объявлений о продаже квартир 

## Данные

Проект использует данные сервиса Яндекс Недвижимость, включающие архив объявлений о продаже квартир в Санкт-Петербурге и соседних населённых пунктах за несколько лет. Данные содержат как пользовательские, так и автоматически собранные параметры, такие как расстояние до центра города, аэропорта и других объектов, а также данные о наличии парков и водоёмов.

## Задача

Цель проекта — провести исследовательский анализ данных для определения рыночной стоимости объектов недвижимости. На основе анализа требуется установить параметры, влияющие на цену квартир, что позволит построить автоматизированную систему для отслеживания аномалий и мошеннической деятельности.

## Описание данных

- **airports_nearest** — расстояние до ближайшего аэропорта в метрах (м)
- **balcony** — число балконов
- **ceiling_height** — высота потолков (м)
- **cityCenters_nearest** — расстояние до центра города (м)
- **days_exposition** — сколько дней было размещено объявление (от публикации до снятия)
- **first_day_exposition** — дата публикации
- **floor** — этаж
- **floors_total** — всего этажей в доме
- **is_apartment** — апартаменты (булев тип)
- **kitchen_area** — площадь кухни в квадратных метрах (м²)
- **last_price** — цена на момент снятия с публикации
- **living_area** — жилая площадь в квадратных метрах (м²)
- **locality_name** — название населённого пункта
- **open_plan** — свободная планировка (булев тип)
- **parks_around3000** — число парков в радиусе 3 км
- **parks_nearest** — расстояние до ближайшего парка (м)
- **ponds_around3000** — число водоёмов в радиусе 3 км
- **ponds_nearest** — расстояние до ближайшего водоёма (м)
- **rooms** — число комнат
- **studio** — квартира-студия (булев тип)
- **total_area** — общая площадь квартиры в квадратных метрах (м²)
- **total_images** — число фотографий квартиры в объявлении

## Используемые библиотеки

- `pandas`
- `numpy`
- `matplotlib` и `seaborn` 
- `scikit-learn`
- `seaborn` 

## Статус проекта

Завершен