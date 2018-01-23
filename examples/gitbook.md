# App Pages

API for managing In-App Pages

{% api "List App Pages", method="GET", url="/api/portal/v1/app_pages/:app_id/page/:page" %}

**URL:** https://www.magloft.com/api/portal/v1/app_pages/:app_id/page/:page

This endpoint **returns** a list of all `app pages` that belong to the magazine

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
  "created_at": "2018-01-23 12:36:35",
  "updated_at": "2018-01-23 12:36:35",
  "published": true,
  "html": "<p>Hello World</p"
}
```

{% endapi %}

{% api "Get App Page", method="GET", url="/api/portal/v1/app_pages/:app_id/:id" %}

**URL:** https://www.magloft.com/api/portal/v1/app_pages/:app_id/:id

This endpoint **returns** a specific `app page` by `id`

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
  "created_at": "2018-01-23 12:36:35",
  "updated_at": "2018-01-23 12:36:35",
  "published": true,
  "html": "<p>Hello World</p"
}
```

{% endapi %}

{% api "Create App Page", method="POST", url="/api/portal/v1/app_pages/:app_id" %}

**URL:** https://www.magloft.com/api/portal/v1/app_pages/:app_id

This endpoint **creates** a new `app page` and **returns** the saved `app page`

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
  "created_at": "2018-01-23 12:36:35",
  "updated_at": "2018-01-23 12:36:35",
  "published": true,
  "html": "<p>Hello World</p"
}
```

{% endapi %}

{% api "Update App Page", method="PUT", url="/api/portal/v1/app_pages/:app_id/:id" %}

**URL:** https://www.magloft.com/api/portal/v1/app_pages/:app_id/:id

This endpoint **updates** a specific `app page` by `id` and **returns** the updated `app page`

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
  "created_at": "2018-01-23 12:36:35",
  "updated_at": "2018-01-23 12:36:35",
  "published": true,
  "html": "<p>Hello World</p"
}
```

{% endapi %}

{% api "Delete App Page", method="DELETE", url="/api/portal/v1/app_pages/:app_id/:id" %}

**URL:** https://www.magloft.com/api/portal/v1/app_pages/:app_id/:id

This endpoint **deletes** a specific `app page` by `id` and **returns** an `empty response`

### Parameters:

| Name       | Type    | Desc                       |
| :--------- | :------ | :------------------------- |
| **app_id** | String  | App ID the page belongs to |
| **id**     | Integer | App Page ID                |

{% endapi %}
