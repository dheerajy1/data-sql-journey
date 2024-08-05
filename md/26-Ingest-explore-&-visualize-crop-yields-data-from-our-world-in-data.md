This article talks about the performing data ingesting, exploration, analysis and building data visualizations for crop yields across the world.

# <mark>5 august</mark>

# 1\. Data Source

Data for

1. crop yields across the world. \[[**Link\]**](https://ourworldindata.org/explorers/crop-yields)

# **2\. Ingest Data**

```javascript
fetchUrl = async (targetUrl, typed = false) => {
  try {
    const response = await fetch(targetUrl);

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const contentType = response.headers.get("Content-Type");

    if (contentType?.startsWith("text/csv")) {
      const csvData = await response.text();
      if (typed) {
        return d3.csvParse(csvData, d3.autoType);
      }
      return d3.csvParse(csvData);
    } else if (contentType?.startsWith("application/json")) {
      const data = await response.json();
      if (typed) {
        return data.map(d3.autoType);
      }
      return data;
    } else if (contentType === null) {
      const csvData = await response.text();
      if (typed) {
        return d3.csvParse(csvData, d3.autoType);
      }
      return csvData;
    } else {
      throw new Error("Unsupported content type: ${contentType}");
    }
  } catch (error) {
    return `Error: ${error.message}`;
  }
};
```

Error:

- faced as issue where the content type is null, hence unable to determine the parsing type automatically, therefore placed a null condition. ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1722878281242/cbb62094-2b23-4ef3-bf3e-a8ac1588893a.png)


![](https://cdn.hashnode.com/res/hashnode/image/upload/v1722878111018/a860820f-0263-47c5-971a-67a7926b7c65.png)

# Conclusion

Learning Objectives,

1. Data Ingestion
2. Observable Notebook

# Source: Observablehq \[Link\]

# Author: Dheeraj. Yss

# Connect with me:

- [My Twitter](https://twitter.com/yssdheeraj)
- [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
- [My GitHub](https://github.com/dheerajy1)
- [My Hashnode](https://dheerajy1.hashnode.dev/)