Feature: Viewing dashboard
  In order to keep track of current happenings in the co-op
  As a Member
  I want to view a dashboard of recent and upcoming events, and things that require my attention

  Background:
    Given there is a co-op
    And I am a Member of the co-op
    And I have applied for some shares

  Scenario: Member views tasks that require their attention
    When I go to the Dashboard page
    Then I should see notifications of issues that require my attention
