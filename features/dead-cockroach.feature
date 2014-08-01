@vcr
Feature: get height-adjusted JSON

  Scenario: Get JSON for a single character
    When I go to "/a"
    Then the response should be JSON:
    """
    {
    "id": "a",
    "data": [
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 4, 4, 4, 0, 0, 0],
    [0, 0, 0, 0, 0, 4, 0, 0],
    [0, 0, 4, 4, 4, 4, 0, 0],
    [0, 4, 0, 0, 0, 4, 0, 0],
    [0, 0, 4, 4, 4, 4, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0]
    ]
    }
    """

  Scenario: Get JSON for a 7-unit character
    When I go to "/2"
    Then the response should be JSON:
    """
    {
    "id": "2",
    "data": [
      [0, 0, 4, 4, 4, 4, 0, 0],
      [0, 4, 0, 0, 0, 0, 4, 0],
      [0, 0, 0, 0, 0, 0, 4, 0],
      [0, 0, 4, 4, 4, 4, 0, 0],
      [0, 4, 0, 0, 0, 0, 0, 0],
      [0, 4, 4, 4, 4, 4, 4, 0],
      [0, 0, 0, 0, 0, 0, 0, 0]
    ]
    }
    """

  Scenario: Get JSON for a variable-height string
    When I go to "/©2"
    Then the response should be JSON:
    """
    {
    "id":"©2",
    "data":[
      [0, 0, 4, 4, 4, 4, 0, 0, 0, 0, 4, 4, 4, 4, 0, 0],
      [0, 4, 0, 0, 0, 0, 4, 0, 0, 4, 0, 0, 0, 0, 4, 0],
      [4, 0, 0, 4, 4, 0, 0, 4, 0, 0, 0, 0, 0, 0, 4, 0],
      [4, 0, 4, 0, 0, 0, 0, 4, 0, 0, 4, 4, 4, 4, 0, 0],
      [4, 0, 0, 4, 4, 0, 0, 4, 0, 4, 0, 0, 0, 0, 0, 0],
      [0, 4, 0, 0, 0, 0, 4, 0, 0, 4, 4, 4, 4, 4, 4, 0],
      [0, 0, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    ]
    }
    """
