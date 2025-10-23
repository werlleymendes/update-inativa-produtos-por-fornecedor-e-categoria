UPDATE consinco.mrl_produtoempresa
       SET b.statuscompra = 'I'
       WHERE b.estqloja          <= 0 and
             b.estqtroca         <= 0 and
             b.nroempresa        = &empresa  and
             b.statuscompra      = 'A'  and
             b.qtdpendpedcompra  = 0  and
             b.dtaultmovtacao    < trunc(sysdate) - 540;
             
             
SELECT * FROM consinco.mrl_produtoempresa a 
       JOIN consinco.map_produto b
            ON a.seqproduto = b.seqproduto
       JOIN consinco.map_familia c
            ON c.seqfamilia = b.seqfamilia
       JOIN consinco.map_famfornec d
            ON c.seqfamilia = d.seqfamilia
       JOIN consinco.map_famdivcateg e
            ON c.seqfamilia = e.seqfamilia
       where a.nroempresa = 1 and a.statuscompra = 'A';
