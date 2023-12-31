---
categories:
  - DevOps
tags: [AWS]
---

# OpenSearch

## Background

OpenSearch is the AWS implementation of the opean source Elasticsearch search engine. It was formally known as "AWS Elasticsearch".

It has many features but the core usage is to create searchable indicies of a given content domain such as, for example, a website or content management system. This enables the quick search and retrieval of documents without using expensive database queries.

## Key concepts

We will introduce the main concepts with the example of an internal intranet for which we want to create a searchable index. The intranet comprises hundreds of pages. Each page has the following metadata, conforming to the following example.

```json
{
  "title": "Internal News",
  "author": "Jane Doe",
  "published_date": "2023-11-01T00:00:00Z",
  "tags": ["news", "internal"],
  "categories": ["communication"],
  "content": "Today's internal news and updates are..."
}
```

### Create domain

The OpenSearch domain is a managed environment which hosts OpenSearch **clusters**. It can contain one or more clusters.

The domain provides network **endpoints** you use to communicate and send requests. Typical requests:

- ingest data
- index data
- run search query and return matches

#### Clusters and nodes

A cluster is the highest level of organisation within an OpensSearch domain that contains your indexed data. It processes all the search queries and handles tasks like indexing, searching, and managing documents.

![](/_img/opensearch-architecture.drawio.svg)

A cluster comprises **nodes**. Nodes are individual servers that hold part of the cluster's data. Each node participates in the indexing and searching of the cluster's data.

- This distributed architecture helps in balancing the load and ensuring high availability.
- Data can be replicated accross nodes, making the system resiliant against data loss
- You can add more nodes to the cluster to handle increased data and traffic, making the system adaptable to changing needs.

### Define index and mappings

Assuming the domain has been created. The next step is to create an index for the data, say `intranet_pages`. An index is basically a collection where the data is stored, similar to a database. Each entry is a **document** in this collection.

Our index will store each webpage as a document.

We specify the data that we want to store using an index mapping. For instance we may not want to store all the metadata for each page, preferring only to index a subset of the properties. In this example we will store all the data. We would achieve this with the following:

```json
{
  "mappings": {
    "properties": {
      "title": { "type": "text" },
      "author": { "type": "keyword" },
      "published_date": { "type": "date" },
      "tags": { "type": "keyword" },
      "content": { "type": "text" }
    }
  }
}
```

The mapping will be utilised in the following scenarios:

- storing data:
  - when a new document is added to the `intranet_pages` index, it will adhere to the defined mappings
  - it will have to have the properties specified in the mapping in order to be added
- searching data:
  - when executing searches, OpenSearch utilizes the mappings to understand the type of data in each field and optimizes search queries accordingly
- assessing relevance:
  - proper mappings allow OpenSearch to accurately score and rank search results based on relevance.

### Ingest data (bulk import and/or scraper)

In order to create the index that we previously defined with a mapping it is necessary to implement some sort of mechanism for collating the metadata that matches the mapping. This would be a crawler or scraper that might be implemented with a lambda. This is a key part of the ingestion process.

Alternatively the data could be bulk imported in a format that maps to the index.

### Querying and searching

Having established the crawler (and some kind of search interface), we can now run queries against the OpenSearch domain.

A basic example of the structure of a query would be as follows:

```sh
GET /intranet_pages/_search
```

```json
{
  "query": {
    "match": {
      "content": "project"
    }
  }
}
```

Here we search against the `content` mapping to find pages that contain the word "project".

Example of the data returned:

```json
{
  "hits": {
    "total": { "value": 100 },
    "hits": [
      {
        "_index": "intranet_pages",
        "_id": "1",
        "_score": 1.2,
        "_source": {
          "title": "Project ABC Launch",
          "author": "John Doe",
          "published_date": "2023-01-01T00:00:00Z",
          "tags": ["project", "launch"],
          "content": "Details about the launch of Project ABC..."
        }
      }
      // Additional results here
    ]
  }
}
```

## Search patterns

Below are further examples of commonly used search patterns.

### Multiple conditions

Find documents that are authored by Jane Doe that contain the word "meeting". `must` stands for boolean AND:

```json
{
  "query": {
    "bool": {
      "must": [
        { "match": { "content": "meeting" } },
        { "match": { "author": "Jane Doe" } }
      ]
    }
  }
}
```

Find documents that contain either the word "meeting" or the word "project" in their content. `should` stands for boolean OR:

```json
{
  "query": {
    "bool": {
      "should": [
        { "match": { "content": "meeting" } },
        { "match": { "content": "project" } }
      ],
      "minimum_should_match": 1
    }
  }
}
```

`minimum_should_match` specifies the number of conditions that should match.

### Query by date ranges

Find pages published after a certain date:

```json
{
  "query": {
    "range": {
      "published_date": {
        "gte": "2023-01-01T00:00:00Z"
      }
    }
  }
}
```

```json
{
  "query": {
    "bool": {
      "should": [
        { "match": { "fileId": "val" } },
        { "match": { "programmeId": "val" } },
        { "match": { "guid": "val" } }
      ],
      "minimum_should_match": 1
    }
  }
}
```
