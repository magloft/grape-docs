# App Pages

API for managing In-App Pages

## List App Pages
**URL:** https://www.magloft.com/api/portal/v1/app_pages/:app_id/page/:page

This endpoint **returns** a list of all `app pages` that belong to the magazine

### Request

**METHOD:** GET
**PATH:** /api/portal/v1/app_pages/:app_id/page/:page

### Parameters:
| Name       | Type    | Desc                                                |
| :--------- | :------ | :-------------------------------------------------- |
| **app_id** | String  | App ID to list app pages for                        |
| **page**   | Integer | The page to list                                    |
| per_page   | Integer | Number of items to show per page                    |
| order_by   | Symbol  | Field to sort results by                            |
| order_dir  | Symbol  | Direction (asc, desc) to sort results by            |
| filter     | String  | Text filter to search pages by name, title and html |

### Response:
```json
{
  "id": 1234,
  "name": "Welcome Letter",
  "title": "Welcome to MagLoft",
  "icon": "trophy",
  "trigger": "on_launch",
  "action": "subscribe",
  "visibility": [
    "web",
    "ios",
    "android"
  ],
  "created_at": "2018-01-23 12:34:08",
  "updated_at": "2018-01-23 12:34:08",
  "published": true,
  "html": "<p>Hello World</p"
}
```


## Get App Page
**URL:** https://www.magloft.com/api/portal/v1/app_pages/:app_id/:id

This endpoint **returns** a specific `app page` by `id`

### Request

**METHOD:** GET
**PATH:** /api/portal/v1/app_pages/:app_id/:id

### Parameters:
| Name       | Type    | Desc                       |
| :--------- | :------ | :------------------------- |
| **app_id** | String  | App ID the page belongs to |
| **id**     | Integer | App Page ID                |

### Response:
```json
{
  "id": 1234,
  "name": "Welcome Letter",
  "title": "Welcome to MagLoft",
  "icon": "trophy",
  "trigger": "on_launch",
  "action": "subscribe",
  "visibility": [
    "web",
    "ios",
    "android"
  ],
  "created_at": "2018-01-23 12:34:08",
  "updated_at": "2018-01-23 12:34:08",
  "published": true,
  "html": "<p>Hello World</p"
}
```


## Create App Page
**URL:** https://www.magloft.com/api/portal/v1/app_pages/:app_id

This endpoint **creates** a new `app page` and **returns** the saved `app page`

### Request

**METHOD:** POST
**PATH:** /api/portal/v1/app_pages/:app_id

### Parameters:
| Name       | Type   | Desc                                                                              |
| :--------- | :----- | :-------------------------------------------------------------------------------- |
| **app_id** | String | App ID the page should be created for                                             |
| **name**   | String | Internal name of a page                                                           |
| title      | String | Visible title of a page                                                           |
| icon       | String | Optional icon to show in the modal window or side menu                            |
| trigger    | String | Trigger Event to specify when the page should show up                             |
| action     | String | Call to action to perform when accepting the offer                                |
| html       | String | The html contents of a page                                                       |
| visibility | Array  | An array specifying on which devices the page should be shown (web, ios, android) |

### Response:
```json
{
  "id": 1234,
  "name": "Welcome Letter",
  "title": "Welcome to MagLoft",
  "icon": "trophy",
  "trigger": "on_launch",
  "action": "subscribe",
  "visibility": [
    "web",
    "ios",
    "android"
  ],
  "created_at": "2018-01-23 12:34:08",
  "updated_at": "2018-01-23 12:34:08",
  "published": true,
  "html": "<p>Hello World</p"
}
```

## Update App Page
**URL:** https://www.magloft.com/api/portal/v1/app_pages/:app_id/:id

This endpoint **updates** a specific `app page` by `id` and **returns** the updated `app page`

### Request

**METHOD:** PUT
**PATH:** /api/portal/v1/app_pages/:app_id/:id

### Parameters:
| Name       | Type    | Desc                                                                              |
| :--------- | :------ | :-------------------------------------------------------------------------------- |
| **app_id** | String  | App ID the page belongs to                                                        |
| **id**     | Integer | App Page ID                                                                       |
| name       | String  | Internal name of a page                                                           |
| title      | String  | Visible title of a page                                                           |
| icon       | String  | Optional icon to show in the modal window or side menu                            |
| trigger    | String  | Trigger Event to specify when the page should show up                             |
| action     | String  | Call to action to perform when accepting the offer                                |
| html       | String  | The html contents of a page                                                       |
| visibility | Array   | An array specifying on which devices the page should be shown (web, ios, android) |

### Response:
```json
{
  "id": 1234,
  "name": "Welcome Letter",
  "title": "Welcome to MagLoft",
  "icon": "trophy",
  "trigger": "on_launch",
  "action": "subscribe",
  "visibility": [
    "web",
    "ios",
    "android"
  ],
  "created_at": "2018-01-23 12:34:08",
  "updated_at": "2018-01-23 12:34:08",
  "published": true,
  "html": "<p>Hello World</p"
}
```


## Delete App Page
**URL:** https://www.magloft.com/api/portal/v1/app_pages/:app_id/:id

This endpoint **deletes** a specific `app page` by `id` and **returns** an `empty response`

### Request

**METHOD:** DELETE
**PATH:** /api/portal/v1/app_pages/:app_id/:id

### Parameters:
| Name       | Type    | Desc                       |
| :--------- | :------ | :------------------------- |
| **app_id** | String  | App ID the page belongs to |
| **id**     | Integer | App Page ID                |
