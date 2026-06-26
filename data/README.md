# Данные: ВИЧ экспресс-тесты (открытый доступ)

Все датасеты ниже скачиваются по прямой ссылке, без регистрации и ожидания одобрения.

## Используемые датасеты

### 1. LSHTM Malawi RDT accuracy (основной, диагностика)

| | |
|---|---|
| **DOI** | [10.17037/DATA.105](https://doi.org/10.17037/DATA.105) |
| **Лицензия** | CC BY 3.0 |
| **Прямая ссылка** | https://datacompass.lshtm.ac.uk/id/eprint/214/4/rdt_accuracy.txt |
| **Локальный путь** | `data/raw/lshtm_malawi/rdt_accuracy.txt` |
| **Словарь** | `data/raw/lshtm_malawi/data_dictionary_rdt_TAB.txt` |

Индивидуальные результаты нескольких RDT (Determine, Uni-Gold, OraQuick) vs референс `golds`. Демография: возраст, пол, история тестирования.

### 2. LSHTM Malawi HIV self-testing (SES-прокси)

| | |
|---|---|
| **DOI** | [10.17037/DATA.7](https://doi.org/10.17037/DATA.7) |
| **Лицензия** | CC BY |
| **Прямая ссылка** | https://datacompass.lshtm.ac.uk/id/eprint/31/32/Self-testing_data.zip |
| **Локальный путь** | `data/raw/lshtm_malawi_selftesting/` |

Ключевые таблицы:

- `quality_assurance.txt` — self-test (`st`) vs nurse RDT (`vct`), без привязки к демографии
- `self_testing_individual_crude.txt` — грамотность (`lit`), история тестирования
- `self_testing_individual_revised.txt` — охват self-testing (`selftestprov`) по стратам

**Ограничение:** таблицы намеренно не связаны по id участника (см. User Guide). Анализ точности теста и SES разделены.

## Исключённые источники

| Источник | Причина исключения |
|----------|-------------------|
| [Open ICPSR E108022](https://doi.org/10.3886/E108022V1) (OraQuick, Эфиопия) | Требуется вход в ICPSR |
| [DHS Malawi 2015-16](https://microdata.worldbank.org/catalog/2792) | Регистрация + одобрение проекта |
| PHIA (MPHIA, ZAMPHIA) | Restricted data-use agreement |
| [AHRI m-Africa](https://doi.org/10.23664/AHRI.M-AFRICA.2019.V1) | Регистрация в репозитории AHRI |

Wealth index / доход доступны только через DHS/PHIA с одобрением. Для мгновенного доступа используется `lit` (грамотность) как SES-прокси.

## Воспроизведение

```bash
pip install -r requirements.txt
jupyter notebook notebooks/HIV_RDT_Diagnostics.ipynb
```

Скачивание self-testing (если папка пуста):

```powershell
Invoke-WebRequest -Uri "https://datacompass.lshtm.ac.uk/id/eprint/31/32/Self-testing_data.zip" -OutFile "data/raw/lshtm_malawi_selftesting/Self-testing_data.zip"
Expand-Archive -Path "data/raw/lshtm_malawi_selftesting/Self-testing_data.zip" -DestinationPath "data/raw/lshtm_malawi_selftesting"
```
