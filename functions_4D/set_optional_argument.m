
function argval = set_optional_argument(argname, default_argval, optional_args)

a = find(strcmp(argname, optional_args), 1);
if isempty(a)
  argval = default_argval;
else
  argval = optional_args{a+1};
end
