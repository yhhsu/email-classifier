# email-classifier

We will fit a naive Bayes classifier to classify emails into two categories, pertaining to
- the X Win- dow System (Y = 1) that is common in Unix operating systems
- the Microsoft Windows operating system (Y = 2)

We adopt a bag of words model to extract features of an email, i.e. X = (X1, X2, . . . , Xd) ∈ {0, 1}d is a binary vector denoting absence (Xi = 0) or 
presence (Xi = 1) of each word in the object vocab. These features and the corresponding class labels (last column) are stored in dataset.
