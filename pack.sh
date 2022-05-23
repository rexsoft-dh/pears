pip uninstall -y pears
rm -rf build
rm -rf ./dist/*
python3 setup.py sdist bdist_wheel
pip install ./dist/pears-0.0.1-py3-none-any.whl
pears
# twine upload dist/*
# ukbsearch -s age smoking
# ukbsearch -s age smoking -l and
# ukbsearch -s 'ag*' 'rep*' -l and 
# ukbsearch -s 'ag*' 'rep*' -l and -t udi
# ukbsearch -s 'ag*' 'rep*' -l and

# ukbsearch -s 'ag*' 'rep*' -l and -o test_data -t csv
# ukbsearch -s 'ag*' 'rep*' -l and -o test_data -t console udi csv
# ukbsearch -u ukb26086 20161-0.0 21003-1.0 20009-1.30 -d csv rdata -o test_data3
# ukbsearch -s age --savedata csv rdata --out test_data
# ukbsearch -i ../ukbsearchdata/ukbtest.tab
# ukbsearch -i ../ukbsearchdata/ukb26086.tab

# ukbsearch -u ukb26086 20161-0.0 21003-1.0 20009-1.30 -d csv rdata -o test_data3 -p ../ukbsearchdata
# ukbsearch -u ukbtest 23-0.0 42-2.0 41146-0.0 -d csv rdata -o test_data3 -p ../ukbsearchdata



