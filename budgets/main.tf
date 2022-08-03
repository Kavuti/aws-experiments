resource "aws_budgets_budget" "christian_budget" {
    account_id = "502958977225"
    name = "christian_budget"
    budget_type = "COST"
    limit_amount = "5"
    limit_unit = "USD"
    time_unit = "MONTHLY"
}