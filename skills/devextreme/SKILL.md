---
name: devextreme
description: Use when code imports devextreme or devextreme-react, when working with dx- components, DataGrid, Chart, Scheduler, PivotGrid, Gantt, TreeList, SelectBox, Form, or any DevExpress UI widget. Triggers on ArrayStore, CustomStore, DataSource from devextreme/data, nested option JSX patterns, or any DevExtreme config/event question.
---

# DevExtreme

Enterprise HTML5/JS component suite. 80+ components. React-focused.

## Installation

```bash
npm install devextreme devextreme-react
```

Import a theme (required):
```js
import 'devextreme/dist/css/dx.light.css';
// or dx.dark.css, dx.material.blue.light.css, etc.
```

## React: Core Patterns

### Import per component (tree-shake friendly)
```tsx
import DataGrid, { Column, Selection, Paging, FilterRow } from 'devextreme-react/data-grid';
import Chart, { Series, Legend } from 'devextreme-react/chart';
```

### Nested option components
Config is JSX children, not deeply nested objects:
```tsx
<DataGrid dataSource={orders} keyExpr="id">
  <Column dataField="orderId" caption="Order #" width={100} />
  <Column dataField="customer" />
  <Column dataField="total" format="currency" />
  <Selection mode="multiple" />
  <Paging pageSize={20} />
  <FilterRow visible={true} />
</DataGrid>
```

### Event handling
All events are `on[EventName]` props:
```tsx
<DataGrid
  onRowClick={(e) => console.log(e.data)}
  onSaving={(e) => { e.cancel = true; /* custom save */ }}
  onCellPrepared={(e) => {
    if (e.column.dataField === 'status' && e.value === 'overdue')
      e.cellElement.style.color = 'red';
  }}
/>
```

### Two-way binding (controlled)
Use `default[Prop]` for uncontrolled or pair `[prop]` + `on[Prop]Change` for controlled:
```tsx
// Uncontrolled (DevExtreme manages state)
<DataGrid defaultSelectedRowKeys={[]} />

// Controlled
const [selectedKeys, setSelectedKeys] = useState([]);
<DataGrid
  selectedRowKeys={selectedKeys}
  onSelectedRowKeysChange={setSelectedKeys}
/>
```

### Imperative instance access
```tsx
const gridRef = useRef<DataGridRef>(null);

// Call instance methods
gridRef.current?.instance().refresh();
gridRef.current?.instance().exportToExcel(false);

<DataGrid ref={gridRef} dataSource={data} />
```

### Custom cell/row templates
```tsx
// Render prop
<Column
  dataField="status"
  cellRender={({ value }) => (
    <span className={`badge badge-${value}`}>{value}</span>
  )}
/>

// Component prop
<Column dataField="actions" cellComponent={ActionCell} />
```

## Data Sources

### Array (local)
```tsx
import ArrayStore from 'devextreme/data/array_store';
import DataSource from 'devextreme/data/data_source';

const ds = new DataSource({
  store: new ArrayStore({ data: myArray, key: 'id' }),
  filter: ['active', '=', true],
  sort: [{ selector: 'name', desc: false }],
});
```

### Custom (remote)
```tsx
import CustomStore from 'devextreme/data/custom_store';

const store = new CustomStore({
  key: 'id',
  load(options) {
    return fetch(`/api/items?skip=${options.skip}&take=${options.take}`)
      .then(r => r.json())
      .then(data => ({ data: data.items, totalCount: data.total }));
  },
  insert: (values) => fetch('/api/items', { method: 'POST', body: JSON.stringify(values) }).then(r => r.json()),
  update: (key, values) => fetch(`/api/items/${key}`, { method: 'PATCH', body: JSON.stringify(values) }).then(r => r.json()),
  remove: (key) => fetch(`/api/items/${key}`, { method: 'DELETE' }),
});
```

### OData
```tsx
import ODataStore from 'devextreme/data/odata/store';
const store = new ODataStore({ url: 'https://api.example.com/odata/Orders', key: 'OrderID', version: 4 });
```

## Key Components Quick Reference

| Component | Import path | Key props |
|-----------|-------------|-----------|
| DataGrid | `devextreme-react/data-grid` | `dataSource`, `keyExpr`, `columns`, `editing.mode` |
| TreeList | `devextreme-react/tree-list` | `dataSource`, `keyExpr`, `parentIdExpr` |
| PivotGrid | `devextreme-react/pivot-grid` | `dataSource` (PivotGridDataSource) |
| Chart | `devextreme-react/chart` | `dataSource`, `argumentAxis`, `valueAxis` |
| Scheduler | `devextreme-react/scheduler` | `dataSource`, `views`, `currentDate`, `startDayHour` |
| Gantt | `devextreme-react/gantt` | `tasks`, `dependencies`, `resources` |
| Form | `devextreme-react/form` | `formData`, `items`, `colCount` |
| SelectBox | `devextreme-react/select-box` | `dataSource`, `displayExpr`, `valueExpr` |

## DataGrid: Common Config Patterns

```tsx
<DataGrid
  dataSource={store}
  keyExpr="id"
  showBorders={true}
  remoteOperations={true}   // let server handle paging/filtering/sorting
  height={600}
>
  <Editing mode="row" allowAdding allowUpdating allowDeleting />
  <Selection mode="multiple" selectAllMode="allPages" />
  <FilterRow visible />
  <SearchPanel visible width={240} />
  <Paging pageSize={25} />
  <Pager showPageSizeSelector showInfo allowedPageSizes={[10, 25, 50]} />
  <Export enabled formats={['xlsx', 'pdf']} />
  <GroupPanel visible />
  <Summary>
    <TotalItem column="total" summaryType="sum" valueFormat="currency" />
  </Summary>
</DataGrid>
```

## Theming

```bash
# Theme builder CLI
npx dx-theme-builder

# Or import Material themes
import 'devextreme/dist/css/dx.material.blue.light.compact.css';
```

CSS variable overrides work in modern themes:
```css
:root {
  --base-accent: #0078d4;
  --base-bg: #f5f5f5;
}
```

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Importing from `devextreme-react` (root) | Import from specific path: `devextreme-react/data-grid` |
| Missing theme CSS | Add `import 'devextreme/dist/css/dx.light.css'` |
| Mutating dataSource array directly | Use `ArrayStore` with `push()` or `reload()` the DataSource |
| Forgetting `keyExpr` on DataGrid | Required for editing, selection, and focused row |
| Nested option as object prop instead of child | Use `<Paging pageSize={10} />` child, not `paging={{ pageSize: 10 }}` prop (both work, but JSX children are idiomatic) |
| Remote data but `remoteOperations` not set | Set `remoteOperations={true}` or specific `{ paging: true, filtering: true, sorting: true }` |

## Docs & Demos

- API reference: `js.devexpress.com/React/Documentation/ApiReference/`
- 450+ demos: `js.devexpress.com/Demos/WidgetsGallery/`
- GitHub examples: `github.com/DevExpress/devextreme-examples`
