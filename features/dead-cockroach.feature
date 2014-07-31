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
