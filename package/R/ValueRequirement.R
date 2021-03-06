##
 # Copyright (C) 2011 - present by OpenGamma Inc. and the OpenGamma group of companies
 #
 # Please see distribution for license.
 ##

# Extract the value name from a value requirement string
name.ValueRequirement <- function (requirement) {
  bracket <- regexpr ("{", requirement, fixed = TRUE)
  if (bracket < 0) {
    requirement
  } else {
    substr (requirement, 1, bracket - 1)
  }
}

name.ValueSpecification <- name.ValueRequirement

# Extract the properties from a value requirement string
properties.ValueRequirement <- function (requirement) {
  bracket <- regexpr ("{", requirement, fixed = TRUE)
  if (bracket < 0) {
    empty.ValueProperties
  } else {
    parse.ValueProperties (substr (requirement, bracket + 1, nchar (requirement) - 1))
  }
}

properties.ValueSpecification <- properties.ValueRequirement

# Create a value requirement string from a value name and properties
new.ValueRequirement <- function (name, properties) {
  propertyString <- toString (properties)
  if (propertyString == "EMPTY") {
    name
  } else {
    paste (name, "{", propertyString, "}", sep = "")
  }
}

new.ValueSpecification <- new.ValueRequirement
