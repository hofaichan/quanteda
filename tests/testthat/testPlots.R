context('test plots.R')

test_that("test plot.kwic scale argument default", {

	sda <- kwic(texts(inaugCorpus)[[1]], 'american')
	sdp <- kwic(texts(inaugCorpus)[[1]], 'people')
	mda <- kwic(inaugCorpus, 'american')
	mdp <- kwic(inaugCorpus, 'people')

	# Single document, should be absolute
	p <- plot(sda)
	expect_equal(p$labels$x, 'Token index')

	# Single document, multiple keywords, should be absolute
	p <- plot(sda, sdp)
	expect_equal(p$labels$x, 'Token index')

	# Multiple documents, should be relative
	p <- plot(mda)
	expect_equal(p$labels$x, 'Relative token index')

	# Multiple documents, multiple keywords, should be relative
	p <- plot(mda, mdp)
	expect_equal(p$labels$x, 'Relative token index')

	# Explicit overrides
	p <- plot(sda, scale='absolute')
	expect_equal(p$labels$x, 'Token index')
	p <- plot(sda, sdp, scale='absolute')
	expect_equal(p$labels$x, 'Token index')
	p <- plot(mda, scale='absolute')
	expect_equal(p$labels$x, 'Token index')
	p <- plot(mda, mdp, scale='absolute')
	expect_equal(p$labels$x, 'Token index')

	p <- plot(sda, scale='relative')
	expect_equal(p$labels$x, 'Relative token index')
	p <- plot(sda, sdp, scale='relative')
	expect_equal(p$labels$x, 'Relative token index')
	p <- plot(mda, scale='relative')
	expect_equal(p$labels$x, 'Relative token index')
	p <- plot(mda, mdp, scale='relative')
	expect_equal(p$labels$x, 'Relative token index')


})
