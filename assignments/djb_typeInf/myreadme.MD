1. **Install brew:**
    
    ```jsx
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
    
    - There will be three commands with first two starting with `echo` and last one `eval`. Be sure to run those, then `brew` or `brew help`.
2. **Install swi-prolog (to use swipl):**
    
    ```jsx
    brew install swi-prolog
    ```
    
3. **Open swipl:**
    
    ```jsx
    swipl
    ```
    
4. **Load Code**:
    
    ```
    [typeInf].
    
    % ensure "?-" is present before command, thus ?- [typeInf]
    ```
    
5. **Run test cases**:
    ```
    consult("typeInf.plt"), run_tests().

    % ensure "?-" is present before command, thus ?- consult("typeInf.plt"), run_tests().
    
    ```
