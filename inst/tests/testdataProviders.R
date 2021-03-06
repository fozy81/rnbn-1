context("Test dataProviders")

test_that("Errors given", {
    expect_error(dataProviders(), 'datasets parameter cannot be NULL') 
})

test_that("Warnings given", {
    expect_warning(dataProviders(datasets='foo'), 'Dataset foo returned no taxa, check this is spelt correctly') 
})

test_that("Providers are returned", {
    expect_is(dps <- dataProviders(datasets=c('GA001044','GA000426')), 'data.frame')
    expect_that(nrow(dps) == 2, is_true())
    expect_that('Martin Goodall' %in% dps$contactName, is_true())
})
