from ._logging import get_logger
from ._options import get_options, print_option
from .main import PeaRS


def cli():
    opt = get_options()
    print_option(opt)
    opt['log'] = get_logger(silence=False, debug=False, logfile='')
    bs = PeaRS(opt)
    bs.run()
