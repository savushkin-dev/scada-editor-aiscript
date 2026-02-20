# **Настройка модулей шины с помощью программного обеспечения Startup+**

## **Содержание**

1. [Установка ПО](#Установка-ПО)
2. [Загрузка каталога оборудования](#Загрузка-каталога-оборудования)
3. [Создание проекта](#Создание-проекта)
4. [Подключение к модулю и чтение данных с готового проекта](#Подключение-к-модулю-и-чтение-данных-с-готового-проекта)
4. [Загрузка новых данных в модуль](#Загрузка-новых-данных-в-модуль)

## **Установка ПО** 

Для установки программного обеспечения Startup+ необходимо:
- [перейти по ссылке](https://www.phoenixcontact.com/online/portal/us?uri=pxc-oc-itemdetail:pid=2700636&library=usen&tab=1);
- Перейти в раздел **Downloads**;
- Скачать файл формата **.exe** в ветке **Software**.

## **Загрузка каталога оборудования**

После установки Startup+ необходимо загрузить каталог оборудования:

- В окне **DTM Catalog Management** необходимо нажать кнопку **Search for installed DTMs**:

<p align="center">
<img align="center" src="images/equipment_directory.PNG">
</p>

- Далее нажимаем кнопку **All**:

<p align="center">
<img align="center" src="images/equipment_directory_button.PNG">
</p>

- Затем нажимаем кнопку **Update Catalog and Close Window**:

<p align="center">
<img align="center" src="images/equipment_directory_update.PNG">
</p>

## **Создание проекта**

- **Шаг первый**: выбираем **Create new project** и жмём кнопку **Next**.

<p align="center">
<img align="center" src="images/create_project.PNG">
</p>

- **Шаг второй**: находим необходимое устройство, к которому подключена шина и жмём кнопку **Next**.

<p align="center">
<img align="center" src="images/find_requirement_device.PNG">
</p>

- **Шаг третий**: выбираем тип соединения (при подключении через Ethernet нужно знать IP-адрес устройства, также можно подключаться через com-порт, где не требуется знать адрес и его можно задать через программу) и жмём кнопку **Next**:

<p align="center">
<img align="center" src="images/connection_type.PNG">
</p>

- **Шаг четвёртый**: если IP-адрес известен, необходимо выбрать **Select an already configured device via IP address**, ввести необходимый IP-адрес и жмём кнопку **Next**:

<p align="center">
<img align="center" src="images/configured_address.PNG">
</p>

- **Шаг пятый**: Затем происходит сканирование шины. Нажимаем кнопку **Continue**:

<p align="center">
<img align="center" src="images/topology_scan.PNG">
</p>

- Выбираем версии установленных модулей (При автоматическом выборе будет выбрана первая версия в списке), нажимаем **Continue**:

<p align="center">
<img align="center" src="images/module_version.PNG">
</p>

- После завершения сканирования шины необходимо нажать кнопку **Finish**:

<p align="center">
<img align="center" src="images/finish_scan.PNG">
</p>

## **Подключение к модулю и чтение данных из готового проекта**

- Выбраем модуль, данные которого необходимо считать.
- Для соединения с модулем нажимаем на выделенную кнопку (Connect with device):

<p align="center">
<img align="center" src="images/connect_to_module.PNG">
</p>

- Загружаем данные с модуля, при успешной загрузке модуль будет выделен зеленым цветом:

<p align="center">
<img align="center" src="images/load_module.PNG">
</p>

- Открываем окно оффлайн параметров модуля (нажимаем выделенную кнопку):

<p align="center">
<img align="center" src="images/offline_params.PNG">
</p>

- Здесь мы можем просмотреть параметры каждого канала (выделено жёлтым цветом):

<p align="center">
<img align="center" src="images/parameters_1.PNG">
</p>

## **Загрузка новых данных в модуль**

- Для соединения с модулем нажимаем на выделенную кнопку (Connect with device):

<p align="center">
<img align="center" src="images/connect_to_module.PNG">
</p>

- Далее двойным кликом переходим на сам модуль:

<p align="center">
<img align="center" src="images/modul_.PNG">
</p>

- В разделе **Parameter Menu** выбираем **Startup parametrization**, далее выбираем необходимый порт:

<p align="center">
<img align="center" src="images/mod_param_.PNG">
</p>

-  В настройках порта указываем тип сигнала в поле **Operating mode of the port** и указываем необходимую размерность в соответствующее поле **PD IN\OUT length**.

- Размерность для каждого канала можно посмотреть в заранее сконфигурированном файле Excel в Eplaner. Данный файл находится  **N1-Project-name.edb\DOC\N1-Project-name.xlsx**.

<p align="center">
<img align="center" src="images/list_devices.PNG">
</p>

- Производим требуемую настройку и нажимаем  «Применить» (выделенная кнопка 1), потом загружаем данные на модуль (выделенная кнопка 2):

<p align="center">
<img align="center" src="images/save_module.PNG">
</p>

- Для просмотра графика сигналов нажимаем на уже сконфигурированный модуль правой кнопкой мыши, затем Functions >> IO Chek:

<p align="center">
<img align="center" src="images/signals_1.PNG">
</p>

- Устанавливаем галочки для используемых каналов:

<p align="center">
<img align="center" src="images/signals_2.PNG">
</p>

- Далее нажимаем на кнопку **Refresh on**. После чего можем считывать показания устройств в реальном времени. Так же есть возможность зафиксировать данные в отдельный документ:

<p align="center">
<img align="center" src="images/signals_3.PNG">
</p>