program mammad_token.aleo {
    record MammadToken {
        owner: address,
        amount: u32,
    }

    transition mint(owner: address, amount: u32) -> MammadToken {
        assert(amount <= 1000000u32);
        return MammadToken {
            owner,
            amount,
        };
    }

    transition transfer(token: MammadToken, to: address, amount: u32) -> (MammadToken, MammadToken) {
        return (MammadToken{owner: to, amount}, MammadToken{owner: token.owner, amount: token.amount - amount});
    }

    transition merge(token1: MammadToken, token2: MammadToken) -> MammadToken {
        return MammadToken { owner: token1.owner, amount: token1.amount + token2.amount };
    }
}
